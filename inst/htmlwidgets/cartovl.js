!function(e){var t={};function r(n){if(t[n])return t[n].exports;var o=t[n]={i:n,l:!1,exports:{}};return e[n].call(o.exports,o,o.exports,r),o.l=!0,o.exports}r.m=e,r.c=t,r.d=function(e,t,n){r.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},r.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},r.t=function(e,t){if(1&t&&(e=r(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(r.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)r.d(n,o,function(t){return e[t]}.bind(null,o));return n},r.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return r.d(t,"a",t),t},r.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},r.p="",r(r.s=2)}([function(e,t,r){"use strict";(function(e){var n=r(1);e._cartoVLWidget={},t.a=function(e,t,r){var u={},a=null;return u.renderValue=function(t){console.log(t),o(),a=_cartoVLWidget.map=c(e.id,t.mapProperties),(_cartoVLWidget.layers=Object(n.a)(t.layers)).forEach(e=>e.addTo(a))},u.resize=function(e,t){},u};var o=function(){console.log("carto-vl "+carto.version),console.log("mapbox-gl "+mapboxgl.version)},c=function(e,t){return new mapboxgl.Map({container:e,style:t.style||u,center:t.center||[0,30],zoom:t.zoom||2})},u={version:8,sources:{},layers:[{id:"background",type:"background",paint:{"background-color":"black"}}]}}).call(this,r(3))},function(e,t,r){"use strict";t.a=function(e){return e.map(e=>{let t=new carto.source.GeoJSON(e.data),r=new carto.Viz;return new carto.Layer(e.id,t,r)})}},function(e,t,r){"use strict";r.r(t);var n=r(0);HTMLWidgets.widget({name:"cartovl",type:"output",factory:n.a})},function(e,t){var r;r=function(){return this}();try{r=r||new Function("return this")()}catch(e){"object"==typeof window&&(r=window)}e.exports=r}]);