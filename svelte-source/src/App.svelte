<script lang="ts">
  import { debugData } from "@utils/debugData";
  import { Route, router } from "tinro";
  import { useNuiEvent } from "@hooks/useNuiEvent";
  import { show } from "@store/show";
  import { useFetchNui } from "@hooks/useFetchNui";
  import Root from "./pages/root/Root.svelte";
  import Catalog from "./pages/catalog/Catalog.svelte";
  import { vehicles } from "@store/vehicles";
  import { selected } from "@store/selected";
  import { loading } from "@store/loading";

  router.mode.hash();
  router.goto("/");

  useNuiEvent("openUI", (data: any) => {
    $vehicles = data.vehicles;
    $selected = $vehicles[0];
    $show = true;
  });

  debugData([
    {
      action: "openUI",
      data: null,
    },
  ]);

  const handleESC = (e: KeyboardEvent) => {
    if (e.key !== "Escape") return;

    $show = false;
    $loading = false;
    router.goto("/");
    useFetchNui("catalog:closeUI");
  };

  $: $show
    ? window.addEventListener("keydown", handleESC)
    : window.removeEventListener("keydown", handleESC);
</script>

{#if $show}
  <main class="w-full h-full flex justify-center items-center">
    <div class="text-white w-full h-full">
      <Route path="/">
        <Root />
      </Route>
      <Route path="/catalog">
        <Catalog />
      </Route>
    </div>
  </main>
{/if}
