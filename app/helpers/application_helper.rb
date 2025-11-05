module ApplicationHelper
  include Pagy::Frontend

  def flash_class(type)
    case type.to_sym
    when :notice, :success
      "bg-green-500/20 text-green-300 border border-green-500/50"
    when :alert, :error
      "bg-red-500/20 text-red-300 border border-red-500/50"
    when :warning
      "bg-yellow-500/20 text-yellow-300 border border-yellow-500/50"
    else
      "bg-blue-500/20 text-blue-300 border border-blue-500/50"
    end
  end

  def pagy_tailwind_nav(pagy)
    html = +%(<nav class="flex items-center justify-center space-x-2 mt-4">)

    html << pagy_tailwind_prev_link(pagy)

    pagy.series.each do |item|
      html << case item
      when Integer
        %(<a href="#{pagy_url_for(pagy, item)}" class="px-4 py-2 text-sm font-medium rounded-lg transition-all #{item == pagy.page ? 'bg-gradient-to-r from-purple-600 to-blue-600 text-white shadow-lg shadow-purple-500/30' : 'text-gray-300 hover:bg-gray-700/50 hover:text-white'}">#{item}</a>)
      when String
        %(<span class="px-4 py-2 text-sm text-gray-500">#{item}</span>)
      when :gap
        %(<span class="px-4 py-2 text-sm text-gray-500">...</span>)
      else
        ""
      end
    end

    html << pagy_tailwind_next_link(pagy)
    html << %(</nav>)

    html.html_safe
  end

  def pagy_tailwind_prev_link(pagy)
    if pagy.prev
      %(<a href="#{pagy_url_for(pagy, pagy.prev)}" class="px-4 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700/50 hover:text-white rounded-lg transition-all" rel="prev">
        <i class="bi bi-chevron-left"></i> Anterior
      </a>)
    else
      %(<span class="px-4 py-2 text-sm text-gray-600 rounded-lg cursor-not-allowed">
        <i class="bi bi-chevron-left"></i> Anterior
      </span>)
    end
  end

  def pagy_tailwind_next_link(pagy)
    if pagy.next
      %(<a href="#{pagy_url_for(pagy, pagy.next)}" class="px-4 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700/50 hover:text-white rounded-lg transition-all" rel="next">
        Próximo <i class="bi bi-chevron-right"></i>
      </a>)
    else
      %(<span class="px-4 py-2 text-sm text-gray-600 rounded-lg cursor-not-allowed">
        Próximo <i class="bi bi-chevron-right"></i>
      </span>)
    end
  end
end
