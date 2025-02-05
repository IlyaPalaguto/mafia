import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["timer", "progressRing", "content", "stopButton"];
  static values = { duration: Number };

  connect() {
    this.isRunning = false;
    this.remainingTime = this.durationValue;
    this.circleLength = 2 * Math.PI * this.progressRingTarget.r.baseVal.value;
    this.updateProgressRing();
  }

  updateProgressRing() {
    this.progressRingTarget.style.strokeDasharray = this.circleLength;
    this.progressRingTarget.style.strokeDashoffset = 0;
  }


  toggleStatus() {
    this.changeContent();

    if (this.isRunning) {
      this.pauseTimer();
    } else {
      this.startTimer();
    }
  }

  showPlayIcon() {
    Array.from(this.contentTarget.children).forEach((child) => child.classList.remove("hidden"));
    this.timerTarget.classList.add("hidden");
  }

  startTimer() {
    console.log('start')
    this.isRunning = true;
    this.updateTimer(this.remainingTime);

    this.timerInterval = setInterval(() => {
      if (this.remainingTime > 0) {
        this.remainingTime--;
        this.updateTimer(this.remainingTime);
      } else {
        this.stopTimer();
      }
    }, 1000);
  }

  pauseTimer() {
    this.isRunning = false;
    clearInterval(this.timerInterval);
  }

  changeContent() {
    Array.from(this.contentTarget.children).forEach((child) => child.classList.toggle("hidden"));
  }

  stopTimer() {
    this.isRunning = false;
    clearInterval(this.timerInterval);
    this.updateProgressRing();
    this.showPlayIcon();
    this.remainingTime = this.durationValue;
    this.dispatch("completed", { target: this.stopButtonTarget });
  }

  updateTimer(remainingTime) {
    this.timerTarget.textContent = remainingTime;
    this.animateCircle(remainingTime);
  }

  animateCircle(remainingTime) {
    const progress = remainingTime / this.durationValue;
    this.progressRingTarget.style.strokeDashoffset = this.circleLength * (progress - 1);
  }
}
