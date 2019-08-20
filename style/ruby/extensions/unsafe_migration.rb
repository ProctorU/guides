module RuboCop
  module Cop
    module Migration
      class UnsafeMigration < Cop
        MSG = <<~HEREDOC
          Please verify a default value is safe to apply in this instance.
          Ask in #database / #devops
        HEREDOC

        # This matcher is meant to run against a child node of create_table
        def_node_matcher :_create_table_with_default_column_value?, <<~PATTERN
          (hash <$(pair (sym :default) !nil) ...>)
        PATTERN

        def_node_matcher :add_column_default_option?, <<~PATTERN
          (send nil? :add_column _ _ _ (hash <$(pair (sym :default) !nil) ...>))
        PATTERN

        def_node_matcher :create_table_with_block?, <<~PATTERN
          (block
            (send nil? :create_table ...)
            (args (arg _var))
            _)
        PATTERN

        def create_table_with_default_column_value?(node)
          return false unless node

          if _create_table_with_default_column_value?(node)
            return true
          end

          if node && node.respond_to?(:children) && node.children.any?
            node.children.each do |child| 
              if create_table_with_default_column_value?(child)
                add_offense(child)
              end
            end
          end

          false
        end

        def on_send(node, *args)
          if add_column_default_option?(node)
            add_offense(node)
          end

          if create_table_with_block?(node.parent)
            create_table_with_default_column_value?(node.parent)
          end
        end
      end
    end
  end
end
