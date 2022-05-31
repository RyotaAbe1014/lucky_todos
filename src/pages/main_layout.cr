abstract class MainLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    "Welcome"
  end

  def render
    html_doctype

    html lang: "ja" do
      mount Shared::LayoutHead, page_title: page_title
      body do
        header class: "header" do
          nav class: "navbar navbar-light bg-light" do
            div class: "container-fluid" do
              link "Todos", to: Todos::Index, class: "navbar-brand"
            end
          end
        end
        mount Shared::FlashMessages, context.flash
        main class: "container py-4" do
          content
        end
        
      end
    end
  end
end
