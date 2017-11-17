module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def boolean_display(boolean)
    boolean ? "<i class='fa fa-check' aria-hidden='true'></i>".html_safe : "<i class='fa fa-times' aria-hidden='true'></i>".html_safe
  end

  def yield_with_default(holder, default)
    if content_for?(holder)
      str = content_for(holder).squish
      str += " | #{default}" if holder == :title
      str
    else
      default
    end
  end

  def default_photo(user)
    if user.photos.present?
      image_path user.photos.first.path
    else
      "https://techreport.com/forums/styles/canvas/theme/images/no_avatar.jpg"
    end
  end

  def process_steps(color)
    [
      { title: "JE CRÉE MON COMTE",
        picture: "process_banner/#{color}/star.png"},
      { title: "JE REMPLIS MON PROFIL",
        picture: "process_banner/#{color}/computer.png"},
      { title: "JE CHOISIS MON AU PAIR OU MA FAMILLE ET JE LE/A CONTACTE",
        picture: "process_banner/#{color}/knur.png"},
      { title: "JE VALIDE MA SELECTION",
        picture: "process_banner/#{color}/validation.png"},
      { title: "JE REÇOIS MON CONTRAT",
        picture: "process_banner/#{color}/send.png"},
      { title: "JE VIS L'EXPERIENCE ET JE REJOINS LA COMMUNAUTÉ",
        picture: "process_banner/#{color}/family.png"},
    ]
  end

  def process_steps_html(color)
    # process = process_steps(color).map do |step|
    #   content_tag :div, class: "process-banner-step" do
    #     image_tag step[:picture]
    #     content_tag(:h3, step[:title])
    #   end
    # end
    process = process_steps(color).map do |step|
      content_tag :div, class: "process-banner-step" do
        image_tag("papillon-noir.png") +
        content_tag(:h3, step[:title])
      end
    end
    process.join.html_safe
  end

  def edit_tabs
    {
      blue: [
        {
          title: "TES IDENTIFIANTS",
          path: root_path
        },
        {
          title: "TOI",
          path: root_path,
          infos: "Quelques questions pour commencer !"
        },
        {
          title: "TES SUPERS POUVOIRS",
          path: root_path,
          infos: "Dévoile nous tes secrets..."
        },
        {
          title: "TA FAMILLE IDÉALE",
          path: root_path
        },
        {
          title: "TES DISPONIBILITÉS",
          path: root_path,
          infos: "Ton départ pour l'aventure !"
        }
      ]
    }
  end

  def edit_tabs_html(color)
    content_tag :div, class: "div-spacebetween" do
      edit_tabs[color.to_sym].each.with_index.inject(""){ |tabs, (tab, i)|
        tabs + link_to( "#{ i + 1 }. #{ tab[:title] }",
                       tab[:path],
                       class: "btn btn-#{color}-default width-100")
      }.html_safe
    end
  end
end
