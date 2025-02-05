module TimerHelper
  def render_timer(duration:, on_complete: nil, stop_button_title: "Стоп")
    render partial: "timer/timer", locals: {
      duration: duration,
      data_action: timer_data_action(on_complete),
      stop_button: stop_button_html(stop_button_title, on_complete)
    }
  end

  private

  def timer_data_action(on_complete)
    return nil if on_complete.nil?
    "timer:completed->#{on_complete}"
  end

  def stop_button_html(title, on_complete)
    return if on_complete.nil?

    render partial: "timer/stop_button", locals: { stop_button_title: title }
  end
end
