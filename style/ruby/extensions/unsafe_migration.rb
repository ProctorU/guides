module RuboCop
  module Cop
    module Migration
      class UnsafeMigration < Cop
        MSG = <<~HEREDOC
          Please verify a default column value is safe to apply in this instance.
          Adding default values to large tables in production can cause downtime.
        HEREDOC

        def_node_matcher :add_column_default_option?, <<~PATTERN
          (send nil? :add_column _ _ _ (hash <$(pair (sym :default) !nil) ...>))
        PATTERN

        def_node_matcher :change_column_default_option?, <<~PATTERN
          (send nil? :change_column _ _ _ (hash <$(pair (sym :default) !nil) ...>))
        PATTERN

        # Attempt to ignore 'down' methods
        def up_or_change_method?(node)
          return false unless node.parent && node.parent.parent
          return true unless node.parent.parent.respond_to?(:method_name)
          node.parent.parent.method_name == :up || node.parent.parent.method_name == :change
        end

        def on_send(node, *args)
          if add_column_default_option?(node) && up_or_change_method?(node)
            add_offense(node)
          end

          if change_column_default_option?(node) && up_or_change_method?(node)
            add_offense(node)
          end
        end
      end
    end
  end
end
