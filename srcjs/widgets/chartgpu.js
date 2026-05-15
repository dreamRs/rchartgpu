import "widgets";
import { ChartGPU, connectCharts } from "chartgpu";

const _registry = {};

HTMLWidgets.widget({
  name: "chartgpu",
  type: "output",
  factory: function(el, width, height) {
    let chart = null;
    return {
      renderValue: function(x) {
        var options = x.options;
        var groupId  = x.syncGroup || null;
        var syncZoom = x.syncZoom  || false;
        const container = document.getElementById(el.id);

        if (chart === null) {
          chart = ChartGPU.create(container, options);

          if (groupId) {
            if (!_registry[groupId]) _registry[groupId] = [];
            _registry[groupId].push(chart);

            Promise.all(_registry[groupId]).then(function(instances) {
              connectCharts(instances, { syncZoom: syncZoom });
            });
          }
        } else {
          chart.then(function(instance) {
            instance.setOption(options);
          });
        }
      },
      resize: function(width, height) {
        if (chart) {
          chart.then(function(instance) { instance.resize(); });
        }
      }
    };
  }
});