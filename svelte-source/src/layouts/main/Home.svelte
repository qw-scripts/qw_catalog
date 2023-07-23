<script lang="ts">
  import { useNuiEvent } from "@hooks/useNuiEvent";
  import { cubicOut, cubicIn } from "svelte/easing";
  import { fade } from "svelte/transition";
  import { onMount } from "svelte";
  import { useFetchNui } from "@hooks/useFetchNui";
  import { isEnvBrowser } from "@utils/misc";
  import MyComponent from "@components/MyComponent.svelte";

  let show = false;

  useNuiEvent("openUI", () => {
    show = true;
  });

  const handleClose = () => {
    show = false;
    if (isEnvBrowser()) return;
    useFetchNui("boilerplate:closeUI");
  };

  onMount(() => {
    // Handles the escape key press to close the UI
    const keyHandler = (e: KeyboardEvent) => {
      if (["Escape"].includes(e.code)) handleClose();
    };

    window.addEventListener("keydown", keyHandler);

    return () => window.removeEventListener("keydown", keyHandler);
  });
</script>

<main>
  {#if show}
    <div
      class="container bg-neutral-900 text-neutral-50"
      in:fade={{ duration: 400, easing: cubicOut }}
      out:fade={{ duration: 400, easing: cubicIn }}
    >
      <MyComponent />
    </div>
  {/if}
</main>

<style>
  .container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    border-radius: 5px;
    min-height: 85%;
    min-width: 85%;
    user-select: none;
  }
</style>
