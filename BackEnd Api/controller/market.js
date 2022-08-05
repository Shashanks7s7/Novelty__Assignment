const MarketRecords = require("../model/marketmodel");
const postData = async (req, res) => {
  const data = req.body;
  const newMarketRecord = new MarketRecords(data);

  try {
    await newMarketRecord.save();
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
    const marketList = await MarketRecords.find();
    res.status(200).json(marketList);
  } catch (e) {
    res.status(404).json({
      message: e.message,
    });
  }
};

module.exports = { postData, getData };
