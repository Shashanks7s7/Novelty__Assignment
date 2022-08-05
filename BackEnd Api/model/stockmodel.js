const mongoose = require("mongoose");
const StockModel = new mongoose.Schema(
  {
    stockName: {
      type: String,
      required: true,
    },
    quantity: {
      type: Number,
      required: true,
    },
    amount: {
      type: Number,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);
const StockRecords = mongoose.model("StockRecords", StockModel);
module.exports = StockRecords;
