import "widgets";
import { ChartGPU } from "chartgpu";



HTMLWidgets.widget({

  name: "chartgpu",

  type: "output",

  factory: function(el, width, height) {

    let chart = null;

    return {

      renderValue: function(x) {

        var options = x.options

        const container = document.getElementById(el.id);
        console.log(chart);
        if (chart === null) {
          chart = ChartGPU.create(container, options);
        } else {
          chart.then(function(x) {
            x.setOption(options);
          });
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});

