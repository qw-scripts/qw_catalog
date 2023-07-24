import { writable } from "svelte/store";
import type { Vehicle } from "./vehicles";

export const selected = writable<Vehicle>(null);
