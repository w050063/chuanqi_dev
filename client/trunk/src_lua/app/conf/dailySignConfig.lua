-- 自动生成，请勿修改 
-- 时间：2016/05/20
-- 21102585@qq.com

local dailySignConfig = class("dailySignConfig")
function dailySignConfig:ctor()
	self.fields = {"key", "count", "reward"}
	self.datas = {
		[1] = {1, 2, {{110009,1,500000},{110045,1,100},{110148,1,1},{110127,1,30}}},
		[2] = {2, 5, {{110009,1,500000},{110045,1,150},{110148,1,1},{110127,1,60}}},
		[3] = {3, 10, {{110009,1,500000},{110045,1,200},{110148,1,1},{110127,1,90}}},
		[4] = {4, 17, {{110009,1,500000},{110045,1,250},{110148,1,2},{110127,1,120}}},
		[5] = {5, 26, {{110009,1,500000},{110045,1,300},{110149,1,1},{110140,1,10}}},

	}
end
return dailySignConfig
