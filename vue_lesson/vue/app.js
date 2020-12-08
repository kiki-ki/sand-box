var items = [
  {
    name: '鉛筆',
    price: 300,
    quantity: 1
  },
  {
    name: 'ノート',
    price: 400,
    quantity: 0
  },
  {
    name: '消しゴム',
    price: 500,
    quantity: 0
  },
]

var vm = new Vue({
  el: '#app',
  data: {
    items: items
  },
  filters: {
    numberWithDelimiter: function (val) {
      if (!val) {
        return '0'
      }
      return val.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,')
    }
  }
})
