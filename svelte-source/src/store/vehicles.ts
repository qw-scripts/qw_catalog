import { writable } from "svelte/store";

export interface Vehicle {
  id: number;
  model: string;
  name: string;
  brand: string;
  price: number;
  class: string;
}

export const vehicles = writable<Vehicle[]>([]);
