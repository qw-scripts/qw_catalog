<script lang="ts">
  import { fly } from "svelte/transition";
  import { router } from "tinro";
  let showIntro = true;

  setTimeout(() => {
    router.goto("/catalog");
  }, 3000);
</script>

<div class="flex flex-col items-center justify-center w-full h-full">
  {#if showIntro}
    <div
      class="w-full h-1/2 bg-red-700 flex items-center justify-center"
      in:fly={{ x: -900, duration: 600 }}
      out:fly={{ x: 900, duration: 600 }}
    >
      <div class="text-5xl font-semibold">6STR Custom Mod Shop</div>
    </div>
    <div
      class="w-full h-1/2 bg-black flex items-center justify-center relative"
      in:fly={{ x: 900, duration: 600 }}
      out:fly={{ x: -900, duration: 600 }}
    >
      <div class="text-4xl font-semibold">Customer Experience</div>
      <div class="absolute bottom-4">
        <p>built with 💖 by PixelTech Enterprises</p>
      </div>
    </div>
  {/if}
</div>
