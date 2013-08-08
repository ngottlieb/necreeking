module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def sidebar_reports
    if current_user and current_user.regions.count > 0
      regions = current_user.regions.map { |r| r.id }
      Report.where(region_id: regions).limit(3)
    else
      Report.limit(3)
    end
  end

end
