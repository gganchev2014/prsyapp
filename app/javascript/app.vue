<template>
  <div id='app'>
    <img src="https://www.imageupload.co.uk/images/2018/02/18/persy.png"
      onclick="window.location.pathname == '/' ? window.location.href = '/sign_up' : window.location.href = '/'" border="0">
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: 'hi'
    }
  }
}
</script>

<style scoped>
body{ background-color: black; }
#app{ text-align: center; }
img{ padding-top: 20px; width: 25%; }
img:hover{ border: 20px solid gold; width: 35%; }
</style>
