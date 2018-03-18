import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import VueResource from 'vue-resource'

Vue.use(VueResource);
Vue.use(TurbolinksAdapter);

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const app = new Vue({
    el: '#hello',
    data: {
      message: "Can you say hello?"
    },
    mixins: [TurbolinksAdapter],
    components: { App }
  })
})
