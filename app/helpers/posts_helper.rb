module PostsHelper

  def status_label(status)
    status_span_generator status
  end

  private

  def status_span_generator(status)
    case status
    when 'default'
      content_tag :span, 'Unsubmitted', class: 'label label-primary'
    when 'submitted', 'pending'
      content_tag :span, 'Pending', class: 'label label-warning'
    when 'approved'
      content_tag :span, status.titleize, class: 'label label-success'
    when 'rejected'
      content_tag :span, status.titleize, class: 'label label-danger'
    end
  end
end
