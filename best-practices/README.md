## Best Practices

A simple guide for coding in style.

##### Emails

- Use Mandrill to send emails in `production`.
- Use Mandrill Templates as the email markup.
- Intercept emails on pre-production servers with
  [Letter Opener Web](https://github.com/ProctorU/letter_opener_web).

##### URLs

- Prefer dashes over underscores in paths.
  [Reference](https://support.google.com/webmasters/answer/76329?hl=en).

##### Files

- Files should have a trailing whitespace at the end of the file.
  Set your text editor to do this for you automatically.

##### Helpers

- Helpers should be used sparingly and only for things that are needed from a
global scope. Form objects are a good example of an acceptable global scope.

    ```ruby
    # bad
    module NonGlobalHelper
      def really_niche_button(options = {})
        button_tag 'button', advanced_options_nobody_cares_about ...
      end
    end

    # good
    module ButtonHelper
      def primary_button
        button_tag 'action', class: 'btn btn-primary'
      end
    end
    ```
