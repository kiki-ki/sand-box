var items = [
  {
    name: '鉛筆',
    price: 300,
    quantity: 0
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
    numWithDelimiter: function (val) {
      if (!val) {
        return '0'
      }
      return val.toString().replace(/(\d)(?=(\d{3})+$)/g, '$1,')
    }
  },
  computed: {
    totalPrice: function () {
      return this.items.reduce(function (sum, item) {
        return sum + (item.price * item.quantity)
      }, 0)
    },
    totalPriceWithTax: function () {
      return Math.floor(this.totalPrice * 1.08)
    },
    canBuy: function () {
      return this.totalPriceWithTax >= 1000
    },
    errorMessageClass: function () {
      return {
        color: this.canBuy ? '' : 'red',
        display: this.canBuy ? 'none' : ''
      }
    }
  }
})
