import AnimatedNumber from "@stimulus-components/animated-number";

export default class extends AnimatedNumber {
  connect() {
    super.connect();
    console.log("timer connected");
  }

  animate() {
    console.log("timer started")
    super.animate()
  }

  endTimer() {
    console.log("timer ended")
  }
}
