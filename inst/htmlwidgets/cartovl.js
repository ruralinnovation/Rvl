!function(e){var t={};function n(o){if(t[o])return t[o].exports;var r=t[o]={i:o,l:!1,exports:{}};return e[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=e,n.c=t,n.d=function(e,t,o){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:o})},n.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)n.d(o,r,function(t){return e[t]}.bind(null,r));return o},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s=2)}([function(e,t,n){"use strict";(function(e){var o=n(1);const r=e._cartoVLWidget={};t.a=function(e,t,n){var u={},i=null;return u.renderValue=function(t){console.log(t),c(),mapboxgl.accessToken=t.mapProperties.mapboxAccessToken,i=r.map=a(e.id,t.mapProperties),(r.layers=Object(o.a)(t.layers)).forEach(e=>e.addTo(i))},u.resize=function(e,t){},u};var c=function(){console.log("carto-vl "+carto.version),console.log("mapbox-gl "+mapboxgl.version)},a=function(e,t){return new mapboxgl.Map({container:e,style:t.style||u,center:t.center||[0,30],zoom:t.zoom||2})},u={version:8,sources:{},layers:[{id:"background",type:"background",paint:{"background-color":"black"}}]}}).call(this,n(3))},function(e,t,n){"use strict";const o=function(e,t,n){const o={};return e.forEach(e=>o[e]=t[e][n]),o};t.a=function(e){return e.map(e=>{e.props.df&&(e.data=function(e,t){const n=t.longitude||"lng",r=t.latitude||"lat",c={type:"FeatureCollection",features:[]},a=Object.keys(e)[0],u=Object.keys(e).filter(e=>e!=n&&e!=r),i=e[a].length;for(let t=0;t<i;t++){let a={type:"Feature",geometry:{type:"Point",coordinates:[e[n][t],e[r][t]]},properties:o(u,e,t)};c.features.push(a)}return c}(e.data,e.props));const t=new carto.source.GeoJSON(e.data);e.vizDef=e.vizDef||[];const n=new carto.Viz(e.vizDef.join("\n"));return new carto.Layer(e.id,t,n)})}},function(e,t,n){"use strict";n.r(t);var o=n(0);HTMLWidgets.widget({name:"cartovl",type:"output",factory:o.a})},function(e,t){var n;n=function(){return this}();try{n=n||new Function("return this")()}catch(e){"object"==typeof window&&(n=window)}e.exports=n}]);