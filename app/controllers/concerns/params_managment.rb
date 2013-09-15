module Concerns
  module ParamsManagment
    def correct_params_with_stored(defaults)
      storage = (session[:storage] ||= {})
      box = (storage[self.class] ||= {})

      correct_search_params(box, defaults)
      correct_pagination_params(box)
    end

    def correct_pagination_params(box)
      params[:per_page] ||= box[:per_page]
      params[:page] ||= box[:page]

      box[:per_page] = params[:per_page]
      box[:page] = params[:page]
    end

    def correct_search_params(box, defaults={})
      search_now = (params[:q] || {})
      search_was = (box[:q] ||= {})

      params[:q] = defaults.merge(search_was.merge(search_now))
      box[:q] = params[:q]
    end
  end
end
