<script lang="ts">
  import { debugData } from "@utils/debugData";
  import Home from "@layouts/main/Home.svelte";

  debugData([
    {
      action: "openUI",
      data: null,
    },
  ]);
</script>

<main>
  <Home />
</main>
