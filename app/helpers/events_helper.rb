module EventsHelper
  def attendance_button(event)
    return if !current_user || current_user.already_attending?(event)

    link_to 'attend this event', edit_event_path(event.id)
  end
end
