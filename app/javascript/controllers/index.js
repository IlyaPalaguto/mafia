// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import NestedFormController from "./nested_form_controller"
application.register("nested-form", NestedFormController)

import AnimatedNumber from "./animated_number_controller"
application.register("animated-number", AnimatedNumber)

import Dropdown from "@stimulus-components/dropdown"
application.register("dropdown", Dropdown)

import TimerController from "./timer_controller";
application.register("timer", TimerController);

import VoteController from "./vote_controller";
application.register("vote", VoteController);

import SpeakingController from "./speaking_controller";
application.register("speaking", SpeakingController);
