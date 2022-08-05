const StockRecords = require("../model/stockmodel");
const postData = async (req, res) => {
  const data = req.body;
  const newStockRecord = new StockRecords(data);

  try {
    await newStockRecord.save();
    res.status(200).json({
      message: "message send",
    });
  } catch (e) {
    res.status(404).json({
      message: e.message,
    });
  }
};
const getData = async (req, res) => {
  try {
    const stockList = await StockRecords.find();
    res.status(200).json(stockList);
  } catch (e) {
    res.status(404).json({
      message: e.message,
    });
  }
};

module.exports = { postData, getData };
