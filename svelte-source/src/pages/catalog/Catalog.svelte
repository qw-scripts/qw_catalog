<script lang="ts">
  import { useFetchNui } from "@hooks/useFetchNui";
  import { useNuiEvent } from "@hooks/useNuiEvent";
  import { loading } from "@store/loading";
  import { selected } from "@store/selected";
  import { vehicles } from "@store/vehicles";
  import { USDollar } from "@utils/formatMoney";

  useNuiEvent("updateSelected", (data: any) => {
    $selected = data.vehicle;
  });

  async function handlePrevious() {
    if ($loading) return;
    $loading = true;
    const response = await useFetchNui("catalog:previous", {
      current: $selected.id,
    });

    if (response) {
      $loading = false;
    }
  }

  async function handleNext() {
    if ($loading) return;
    $loading = true;
    const response = await useFetchNui("catalog:next", {
      current: $selected.id,
    });

    if (response) {
      $loading = false;
    }
  }
</script>

<div class="flex flex-col items-center justify-center w-full h-full">
  {#if $loading}
    <div class="w-full h-full flex items-center justify-center">
      <div role="status">
        <svg
          aria-hidden="true"
          class="w-12 h-12 mr-2 text-dark-200 animate-spin dark:text-dark-600 fill-yellow-500"
          viewBox="0 0 100 101"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
            fill="currentColor"
          />
          <path
            d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
            fill="currentFill"
          />
        </svg>
        <span class="sr-only">Loading...</span>
      </div>
    </div>
  {/if}
  <div
    class="absolute top-12 left-6 bg-neutral-900 bg-opacity-80 border-t border-t-red-500 w-[15%]"
  >
    <div class="py-2 px-4 flex justify-between">
      <h1 class="font-extrabold text-6xl text-yellow-500 italic">
        {$selected.class}
      </h1>
      <div class="flex flex-col gap-2 text-end">
        <h1 class="font-extrabold text-2xl italic uppercase">
          {$selected.brand}
        </h1>
        <h1 class="font-bold text-2xl text-neutral-400 italic">
          {$selected.name}
        </h1>
      </div>
    </div>
  </div>
  <div class="absolute top-12 right-6">
    <h1 class="font-extrabold text-6xl text-yellow-500 italic text-drop-shadow">
      {USDollar.format($selected.price)}
    </h1>
  </div>
  <div class="absolute bottom-[6rem]">
    <p class="font-extrabold italic text-xl uppercase text-drop-shadow pl-4">
      {$selected.id} / {$vehicles.length}
    </p>
  </div>
  <div class="absolute bottom-12 flex items-center justify-center gap-12">
    <button
      class="font-extrabold italic text-lg uppercase text-drop-shadow hover:text-yellow-500"
      on:click={handlePrevious}
    >
      Previous
    </button>
    <button
      class="font-extrabold italic text-lg uppercase text-drop-shadow hover:text-yellow-500"
      on:click={handleNext}
    >
      Next
    </button>
  </div>
</div>

<style>
  .text-drop-shadow {
    text-shadow: 4px 2px 2px #000000;
  }
</style>
