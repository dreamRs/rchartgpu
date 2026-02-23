import "widgets";
import { ChartGPU } from "chartgpu";


HTMLWidgets.widget({

  name: "chartgpu",

  type: "output",

  factory: function(el, width, height) {


    return {

      renderValue: function(x) {

        var options = x.options

        const container = document.getElementById(el.id);
        ChartGPU.create(container, options);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
