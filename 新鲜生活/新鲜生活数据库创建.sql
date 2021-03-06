USE Master
GO
IF (DB_ID('FreshLiveDB')IS NOT  NULL)
	DROP DATABASE FreshLiveDB
GO
CREATE DATABASE FreshLiveDB
GO
USE FreshLiveDB
GO

--系统管理员表
CREATE TABLE dbo.AdminUser(
	AdminID int IDENTITY(1,1) NOT NULL PRIMARY KEY ,
	AdminName nvarchar(16) NOT NULL,
	AdminPwd nvarchar(32) NOT NULL,
	Enabled INT --是否启用(1:启用 0：禁用)
) 
INSERT INTO [dbo].[AdminUser]([AdminName],[AdminPwd])VALUES('admin','123')
INSERT INTO [dbo].[AdminUser]([AdminName],[AdminPwd])VALUES('李明','123')


--系统用户表
CREATE TABLE dbo.UserInfo(
	UserID int IDENTITY(1,1) NOT NULL  PRIMARY KEY ,
	UserName nvarchar(16) NOT NULL,
	UserPwd nvarchar(32) NOT NULL,
	QQ nvarchar(16),
	Phone nvarchar(16) NOT NULL,
	Address nvarchar(64) ,
	CreateTime datetime ,
	Enabled int --是否禁用（0：禁用 1：启用）
)
INSERT INTO [dbo].[UserInfo]([UserName],[UserPwd],[QQ],[Phone],[Address],[CreateTime],[Enabled])VALUES ('李华','123','1234561','13264250215','湖北职业技术学院','',1)
INSERT INTO [dbo].[UserInfo]([UserName],[UserPwd],[QQ],[Phone],[Address],[CreateTime],[Enabled])VALUES ('11','123','','','','',1)
--商品类型表
CREATE TABLE dbo.ProductClass(
	classID			int IDENTITY(1,1) NOT NULL  PRIMARY KEY ,
	className		 nvarchar(16) NOT NULL,
	parentClassID	int NOT NULL,
 )
INSERT INTO ProductClass(className,parentClassID)VALUES('蔬菜水果',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('鲜肉禽蛋',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('鲜奶乳品',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('海鲜水产',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('冷冻冷藏',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('粮油副食',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('休闲零食',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('酒水茶饮',0)
INSERT INTO ProductClass(className,parentClassID)VALUES('生态日用',0)
		
INSERT INTO ProductClass(className,parentClassID)VALUES('蔬菜',1)
INSERT INTO ProductClass(className,parentClassID)VALUES('水果',1)
INSERT INTO ProductClass(className,parentClassID)VALUES('礼盒',1)
INSERT INTO ProductClass(className,parentClassID)VALUES('猪肉',2)
INSERT INTO ProductClass(className,parentClassID)VALUES('牛羊肉',2)
INSERT INTO ProductClass(className,parentClassID)VALUES('家禽肉',2)
INSERT INTO ProductClass(className,parentClassID)VALUES('牛奶',3)
INSERT INTO ProductClass(className,parentClassID)VALUES('酸奶',3)
INSERT INTO ProductClass(className,parentClassID)VALUES('鱼',4)
INSERT INTO ProductClass(className,parentClassID)VALUES('虾',4)
INSERT INTO ProductClass(className,parentClassID)VALUES('蟹/贝',4)


select * from ProductClass
 --商品表
CREATE TABLE dbo.Product(
	productID		int IDENTITY(1,1) NOT NULL  PRIMARY KEY ,
	productName			nvarchar(64) NOT NULL,
	productPic		nvarchar(64) NOT NULL,
	productPrice		 money NOT NULL,
	productDesc				ntext NOT NULL,
	classID				int NOT NULL  FOREIGN KEY REFERENCES ProductClass(ClassID),
	addTime				datetime NOT NULL,
	isStop			 INT --是否下架（1：已下架 0：为未下架）
)
Go
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'越南火龙果', N'3020210407410006_160.jpg', 28.0000, N' 因食火龙果健康长寿, 俗名叫长寿果。', 1, CAST(0x0000A2B900000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'知牧羔羊寸排 750g', N'2912_160.jpg', 135.0000, N'羊肉是冬日滋补佳品，营养丰富。', 2, CAST(0x0000A2C100000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'悦海上品 平鱼一条装 240g-260g/袋', N'209803115_160.jpg', 58.0000, N'平鱼(Pomfret)，学名鲳，是一种身体扁平的海鱼。', 4, CAST(0x0000A2B100000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'富味乡黑麻油 185ml/瓶', N'2013052917413556_160.jpg', 25.5000, N'精选100%优质黑芝麻，采用传统压榨工艺而成，充分保留其浓郁香味', 4, CAST(0x0000A2A900000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'一品玉和田枣五星 450g/袋*3', N'2013064113959168_160.jpg', 128.0000, N'新疆和田玉枣', 7, CAST(0x0000A2A700000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'科尔沁风干牛肉原味250g ', N'2014017162520357_160.jpg', 59.0000, N'自然放养，只为您吃上放心的牛肉。', 6, CAST(0x0000A2BC00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'农场特惠蔬菜包（6种）约6斤', N'20140117093620550_160.jpg', 78.0000, N'礼包包含： ', 1, CAST(0x0000A2A700000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'乌拉圭肥羊排 1kg/份', N'20140116135628348_160.jpg', 59.0000, N'奔跑羊，肉味鲜，口感醇厚', 2, CAST(0x0000A2AA00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'进口蓝莓', N'20140120162230687_160.jpg', 19.8000, N'甜酸适口，美颜佳果', 1, CAST(0x0000A2AA00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'（32城配送）乌拉圭羊前腿 1kg/袋 ', N'1020310399800001_160.jpg', 59.0000, N'乌拉圭羊前腿', 2, CAST(0x0000A2AB00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'佳洋 海鲈鱼 约650g/条', N'2176_160.jpg', 32.8000, N'海鲈鱼蛋白质丰富，肉质鲜美，是常见的海洋经济鱼类之一。比较著名的菜肴有宫保海鲈球。 ', 4, CAST(0x0000A2AB00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'生态胡萝卜', N'20130619143511416_160.jpg', 12.4000, N'土人参，营养价值高', 1, CAST(0x0000A2C500000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'有机结球生菜', N'2035094757600_160.jpg', 13.8000, N'色泽鲜艳，质地脆嫩', 1, CAST(0x0000A2CF00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'有机大白菜', N'20480313816_160.jpg', 10.0000, N'叶嫩、梆脆、汁多，吃起来清香鲜美', 1, CAST(0x0000A2CF00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'有机圆白菜', N'20130527145208719_160.jpg', 12.8000, N'质地脆嫩，香甜味美', 1, CAST(0x0000A2CF00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'有机西葫芦', N'2013059100102567_160.jpg', 15.8000, N'皮薄、肉厚、汁多、鲜嫩', 1, CAST(0x0000A2D000000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'进口血橙 4个/份', N'3020310469700001_160.jpg', 39.0000, N'血橙是橙的变种，带有深红色似血颜色的果肉与汁液。这种水果较寻常的橙还要小；表皮通常有小凹点，但也可以是平滑的。', 1, CAST(0x0000A2D000000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'精品天水花牛苹果 2个/份 约500g', N'3020310481720001_160.jpg', 15.0000, N'世界三大著名苹果品牌之一，是中国在国际市场上第一个获得正式商标的苹果品种。', 1, CAST(0x0000A2D000000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'进口姬娜果 4个/份', N'3020210444860006_160.jpg', 30.8000, N'全方位的健康水果', 1, CAST(0x0000A2D100000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'赣南脐橙【不催熟、不打蜡，自然成熟】 约5斤/份', N'3020310370810019_160.jpg', 28.8000, N'将果品放置在门窗遮光、室内温度6-10℃、相对湿度85%～90%的环境保存，昼夜温差变化尽量小。同时，可在地面洒水或盆中盛水等方法提高空气湿度，切记不能放在空调或暖气开放的室内，北方不能放置在露天阳台。 ', 1, CAST(0x0000A2B100000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'冷鲜肉—添康生态有机猪肉前肩 350g/盒', N'2013074103146503_160.jpg', 35.0000, N'有机、无激素、无生长素', 2, CAST(0x0000A2B100000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'农场自养猪前肘 850-950g/袋', N'20140116144522309_160.jpg', 99.0000, N'850-950g/袋', 2, CAST(0x0000A2A600000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'农场自养猪后肘 约1000-1200g/袋', N'1010210361600002_160.jpg', 108.0000, N'天然饲养', 2, CAST(0x0000A2C600000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'冷鲜肉—添康生态有机五花肉 350g/盒', N'20130729093409713_160.jpg', 42.0000, N'供应商设备原因，最近几天的冷鲜肉包装换为真空包装+塑料盒，鲜肉在抽真空的时候会有组织液渗出现象，但是不影响商品品质', 2, CAST(0x0000A2CF00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'澳洲雪花上脑 300g/袋', N'20130724140847419_160.jpg', 119.0000, N'高端牛肉典范', 2, CAST(0x0000A2D100000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'圣野特种野猪后腿肉 500g/袋', N'3010110234410001_160.jpg', 39.8000, N'天然富氧，无菌加工', 2, CAST(0x0000A2C500000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'密云水库野生银鱼礼盒 3000g', N'20130428172404505_160.jpg', 369.0000, N'高蛋白，低脂', 4, CAST(0x0000A2C700000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'九洋条冻大黄鱼 500g/袋', N'2048095429100_160.jpg', 56.8000, N'深海、天然野生，地标产品！', 4, CAST(0x0000A2C600000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'野生大目金枪鱼（A级）切片 200g/盒', N'2010210384820005_160.jpg', 298.0000, N'补脑：DHA含量居各种鱼类之首，素有“脑黄金鱼”的美誉；清脂：EPA（血管清道夫）含量是其它鱼类的数倍甚至十几倍； ', 4, CAST(0x0000A2C900000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'泰国正大CP巴沙鱼片（带皮） 1000g/袋（学名：鲶鱼）', N'20130710113034810_160.jpg', 29.9000, N'巴沙鱼也叫龙利鱼。其肉质细嫩营养丰富、属于出肉率高、味道鲜美的优质。 ', 4, CAST(0x0000A2CA00000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'纽麦福全脂纯牛奶 1L/盒', N'2013074095625176_160.jpg', 20.0000, N'适用人群：白领，1周岁以上的孩子。', 3, CAST(0x0000A2B400000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'多美鲜全脂牛奶 1L*12盒/箱', N'1060310485480001_160.jpg', 139.0000, N'SUKI多美鲜牌是国际著名的进口乳制品品牌，旗下有众多的乳制品品类：奶酪、黄油、喷奶油、咖啡鲜奶、牛奶、酸奶等。 在全世界各地有众多的生产基地，如美国的奶酪和黄油生产基地、德国牛奶和酸奶的生产基地，还包括荷兰、阿根庭、奥地利、澳大利亚、新西兰等。', 3, CAST(0x0000A2B500000000 AS DateTime), 1)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'德亚低脂牛奶 1L/盒', N'20130827141515567_160.jpg', 22.9000, N'德国高品质牛奶的象征', 3, CAST(0x0000A2CB00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'归原有机鲜牛奶 243ml/盒(8盒/箱)', N'2014011613390831_160.jpg', 11.0000, N'中国第一个有机牛奶', 3, CAST(0x0000A2CC00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'顶羊纯羊奶 250ml*12盒/箱', N'3050210289030003_160.jpg', 98.0000, N'顶级奶品，全家共享', 3, CAST(0x0000A2CD00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'赛瑞海参活力乳 250ML*10/提', N'20510614809_160.jpg', 79.0000, N'中国海洋食品的领先者', 3, CAST(0x0000A2CE00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'欧德堡超高温处理脱脂牛奶1L/盒', N'20130625103824415_160.jpg', 17.4000, N'欧德堡牛奶口感优质，奶香浓郁，奶味佳，品种多样，食用方便，居家旅行可常备。包装上有方便您开启和保存的扭盖，并且有专业的开盖后自动开启锡纸的专利性设计。', 3, CAST(0x0000A2CF00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'蟹田生态米 5kg/袋', N'2162_160.jpg', 59.0000, N'蟹田米：在种植大米的时候把螃蟹放入田中。', 6, CAST(0x0000A2B400000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'隆福源 长粒香米 5kg/袋', N'2811_160.jpg', 59.0000, N'长粒香米出自五常的珍贵黑土地带，这里昼夜温差大，土壤环境得天独厚，无污染水源长年灌溉，使得栽种出来的大米，粒粒圆饱光亮，绵密细致，带着黑土地的纯朴芬芳，为你健康美食带来别样滋味。', 6, CAST(0x0000A2B500000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'亲民有机面粉 2.5kg/袋', N'20130711101741672_160.jpg', 36.8000, N'有机种植、欧盟标准', 6, CAST(0x0000A2B600000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'阿茜娅混合橄榄油 500ml/瓶', N'2044092443306_160.jpg', 71.5000, N'在橄榄油为主要食用油的地中海地区， 特别是希腊，心脏病、癌症和其它慢性病的发病率大大低于其它地区。橄榄油所含的角鲨烯、类黄酮、多酚等成份能保护细胞免受自由基的侵害，橄榄油富含单不饱和脂肪酸能降低胆固醇并且增加高密度脂蛋白胆固醇，从而消除细胞内的游离胆固醇，能够防止动脉粥样硬化的发生。', 6, CAST(0x0000A2B700000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'生态小镇有机花生油 1L/瓶 低温物理压榨', N'20960245_160.jpg', 88.0000, N'非转基因，物理压榨', 6, CAST(0x0000A2B800000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'禾然有机糙米醋 500ml/瓶', N'3040_160.jpg', 27.5000, N'禾然有机是一种品质、品位、科技、时尚、和谐与尊贵，且极具个性魅力的现代健康食品，她不但让消费者健康、轻松的面对生活，而且享受生活，同时，不断满足消费者的社会需求和身份需求，畅想顶级、天然的生活方式。', 6, CAST(0x0000A2AE00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'美兰卡可可蜂蜜蛋糕 100g/盒', N'2052095906572_160.jpg', 35.0000, N'本土化的味道体现的淋漓尽致。它采用的是粗面粉制作，蜂蜜是天然的防腐剂，这也是为何在无防腐剂的状态下可以做到长时间保鲜。而且在包装上也采用了目前世界上最先进的充氮气绿色包装，这也很好的保证了蛋糕的新鲜程度。', 7, CAST(0x0000A2C900000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'乐活氏八宝坚果 250g/罐', N'2013074151327333_160.jpg', 35.0000, N'按照一定配比原创的一款混合果仁', 7, CAST(0x0000A2CB00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'根兴芝麻酥（椒香味）428g/袋', N'2013073112459581_160.jpg', 26.9000, N'根兴芝麻酥诞生于唐玄宗年间内江甜城一注镇作坊，因其香脆可口，携带方便而流传至今。生产过程中，将花生、小麦、玉米等粮食作物严格筛选，采用传统纯手工工艺和祖传秘方制作，不添加任何食品添加剂，充分保持原生态风味。', 7, CAST(0x0000A2CD00000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'绿纯荆花蜜 788g/瓶', N'20130529170802349_160.jpg', 29.0000, N'清热解毒 散寒明目 去火润肺', 7, CAST(0x0000A2D200000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'乐活氏山楂糖 450g/袋', N'20130729180052467_160.jpg', 31.0000, N'初恋般的感觉，一种天然味', 7, CAST(0x0000A2D200000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'新疆纸皮核桃 500g 基地直采', N'2013073112553289_160.jpg', 49.0000, N'置于阴凉干燥处，0℃-5℃环境中储存效果更佳', 7, CAST(0x0000A2D100000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'泰国正大CP虾肉馄饨12个 144g/盒', N'4050310251210005_160.jpg', 29.9000, N'物美价廉，里面是整只虾', 5, CAST(0x0000A2B300000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'泰国正大CP虾肉馄饨面（冬荫功味）184g/盒', N'1080210395920005_160.jpg', 26.0000, N'烹饪方法', 5, CAST(0x0000A2B400000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'泰国正大CP虾肉馄饨面6盒装 （147g*6）', N'1080210395820002_160.jpg', 106.0000, N'烹饪方法', 5, CAST(0x0000A2B500000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'尚料理 西班牙海鲜饭 300克/盒', N'20130521164901115_160.jpg', 44.9000, N'太平洋恩利食品有限公司，产品出口到欧洲、美国、加拿大、日本、韩国等三十六个国家和地区。在同行业中，是海上渔业捕捞量世界第一，水产加工量世界第一，并位居全球同行业综合排名第五位。', 5, CAST(0x0000A2B600000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'尚料理 地中海风味三文鱼柳 170克/盒', N'20130723152545668_160.jpg', 36.8000, N'太平洋恩利食品有限公司，产品出口到欧洲、美国、加拿大、日本、韩国等三十六个国家和地区。在同行业中，是海上渔业捕捞量世界第一，水产加工量世界第一，并位居全球同行业综合排名第五位。', 5, CAST(0x0000A2B700000000 AS DateTime), NULL)
GO
INSERT [Product] ( [ProductName], [ProductPic], [ProductPrice], [ProductDesc], [ClassID], [AddTime], [isStop]) VALUES ( N'福成“鲜到家”宫爆鸡丁 370g/盒', N'20130823164815268_160.jpg', 17.9000, N'主    料：鸡肉（》65%）、水、青豆、大豆油、食品添加剂（磷酸酯双淀粉、三聚磷酸钠、碳酸氢钠）味精、白砂糖、食盐。', 5, CAST(0x0000A2B800000000 AS DateTime), NULL)
GO


--评论表
CREATE TABLE dbo.Comment(
	CommentID int IDENTITY(1,1) NOT NULL  PRIMARY KEY ,
	UserID int NOT NULL FOREIGN KEY REFERENCES UserInfo(UserId),
	ProductID int NOT NULL  FOREIGN KEY REFERENCES Product(ProductId),
	CommentContent ntext NOT NULL,
	Star int NOT NULL,
	CommentTime datetime NOT NULL
) 

--订单表
CREATE TABLE dbo.[Order](
	OrderID int IDENTITY(1,1) NOT NULL  PRIMARY KEY ,
	UserID int NOT NULL FOREIGN KEY REFERENCES UserInfo(UserId),
	OrderTime datetime NOT NULL,
	OrderMoney money NOT NULL,
	DeliverAddress NVARCHAR(100),--收货地址
	IsPay INT, --是否已支付(1：已支付 0：未支付)
	IsDeliver INT ,--是否已发货（1：已发货，0：未发货）
	IsReceive INT ,--是否已收货（1：已收货，0：未收货）
)
select * from [Order]

--订单项表
CREATE TABLE dbo.OrderItem(
	ItemID int IDENTITY(1,1) NOT NULL  PRIMARY KEY ,
	ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
	PayMoney money NOT NULL,
	Num int NOT NULL,
	OrderID int NOT NULL  FOREIGN KEY REFERENCES [Order](OrderID)
)

select * from  OrderItem


