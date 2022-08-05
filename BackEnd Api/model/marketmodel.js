const mongoose = require("mongoose");
const MarketModel = new mongoose.Schema(
  {
    userid:{
        type:String,
        required:true,
    },
    stockName: {
      type: String,
      required: true,
    },
    transactionType:{
        type: String,
        required: true,
      },
    quantity: {
      type: String,
      required: true,
    },
    amount: {
      type: String,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);
const MarketRecords = mongoose.model("MarketRecords", MarketModel);
module.exports = MarketRecords;
