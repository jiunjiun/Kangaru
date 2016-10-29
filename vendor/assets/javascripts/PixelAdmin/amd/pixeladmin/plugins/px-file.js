!function(e,t){if("function"==typeof define&&define.amd)define(["exports","jquery","px/util"],t);else if("undefined"!=typeof exports)t(exports,require("jquery"),require("px/util"));else{var n={exports:{}};t(n.exports,e.jquery,e.util),e.pxFile=n.exports}}(this,function(e,t,n){"use strict";function i(e){return e&&e.__esModule?e:{default:e}}function r(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}Object.defineProperty(e,"__esModule",{value:!0});var o=i(t),u=i(n),s=function(){function e(e,t){for(var n=0;n<t.length;n++){var i=t[n];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(e,i.key,i)}}return function(t,n,i){return n&&e(t.prototype,n),i&&e(t,i),t}}(),f=function(e){var t="pxFile",n="px.file",i="."+n,o=e.fn[t],f={BROWSE:"px-file-browse",CLEAR:"px-file-clear",HAS_VALUE:"px-file-has-value"},c={CLICK:"click"+i,CHANGE:"change"+i},l=function(){function o(t){r(this,o),this.element=t,this.input=e(t).find(".custom-file-input")[0],this.control=e(t).find(".custom-file-control")[0],this.placeholder=this.control.innerHTML,this._checkElement(),this._checkInput(),this._checkControl(),this._setListeners(),this.update()}return s(o,[{key:"browse",value:function(){e(this.input).trigger("click")}},{key:"clear",value:function(){e(this.input).wrap("<form>").parent().on("reset",function(e){e.stopPropagation()}).trigger("reset"),e(this.input).unwrap(),this.update()}},{key:"update",value:function(){var t=(this.input.value||"").replace(/\\/g,"/").split("/").pop();t?e(this.control).text(t):this.control.innerHTML=this.placeholder,u.default[t?"addClass":"removeClass"](this.element,f.HAS_VALUE)}},{key:"destroy",value:function(){this._unsetListeners(),e(this.element).removeData(n)}},{key:"_checkElement",value:function(){if(!u.default.hasClass(this.element,"custom-file"))throw new Error(t+" plugin must be called on a custom file input wrapper.")}},{key:"_checkInput",value:function(){if(!this.input)throw new Error("File input is not found.")}},{key:"_checkControl",value:function(){if(!this.control)throw new Error(".custom-file-control element is not found.")}},{key:"_rejectEvent",value:function(e){e&&(e.stopPropagation(),e.preventDefault())}},{key:"_setListeners",value:function(){var t=this;e(this.element).find("."+f.BROWSE).on(this.constructor.Event.CLICK,function(n){t._rejectEvent(n),t.browse(),e(t.input).trigger("focus")}),e(this.element).find("."+f.CLEAR).on(this.constructor.Event.CLICK,function(n){t._rejectEvent(n),t.clear(),e(t.input).trigger("focus")}),e(this.input).on(this.constructor.Event.CHANGE,e.proxy(this.update,this))}},{key:"_unsetListeners",value:function(){e(this.element).find("."+f.BROWSE).off(i),e(this.element).find("."+f.CLEAR).off(i),e(this.input).off(i)}}],[{key:"_jQueryInterface",value:function(t){return this.each(function(){var i=e(this).data(n);if(i||(i=new o(this),e(this).data(n,i)),"string"==typeof t){if(!i[t])throw new Error('No method named "'+t+'".');i[t]()}})}},{key:"NAME",get:function(){return t}},{key:"DATA_KEY",get:function(){return n}},{key:"Event",get:function(){return c}},{key:"EVENT_KEY",get:function(){return i}}]),o}();return e.fn[t]=l._jQueryInterface,e.fn[t].Constructor=l,e.fn[t].noConflict=function(){return e.fn[t]=o,l._jQueryInterface},l}(o.default);e.default=f});