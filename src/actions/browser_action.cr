abstract class BrowserAction < Lucky::Action
  include Lucky::ProtectFromForgery
  include Lucky::Paginator::BackendHelpers
  def paginator_per_page : Int32
    3 # Return a static value

    # Or allow using a param with a default
    params.get?(:per_page).try(&.to_i) || 3
  end
  # By default all actions are required to use underscores.
  # Add `include Lucky::SkipRouteStyleCheck` to your actions if you wish to ignore this check for specific routes.
  include Lucky::EnforceUnderscoredRoute

  # This module disables Google FLoC by setting the
  # [Permissions-Policy](https://github.com/WICG/floc) HTTP header to `interest-cohort=()`.
  #
  # This header is a part of Google's Federated Learning of Cohorts (FLoC) which is used
  # to track browsing history instead of using 3rd-party cookies.
  #
  # Remove this include if you want to use the FLoC tracking.
  include Lucky::SecureHeaders::DisableFLoC

  accepted_formats [:html, :json], default: :html
end
