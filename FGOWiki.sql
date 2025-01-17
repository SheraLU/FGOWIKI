USE [master]
GO
/****** Object:  Database [fgowiki]    Script Date: 2018/12/18 23:44:51 ******/
CREATE DATABASE [fgowiki]
 CONTAINMENT = NONE
GO
ALTER DATABASE [fgowiki] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fgowiki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fgowiki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fgowiki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fgowiki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fgowiki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fgowiki] SET ARITHABORT OFF 
GO
ALTER DATABASE [fgowiki] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fgowiki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fgowiki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fgowiki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fgowiki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fgowiki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fgowiki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fgowiki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fgowiki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fgowiki] SET  ENABLE_BROKER 
GO
ALTER DATABASE [fgowiki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fgowiki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fgowiki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fgowiki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fgowiki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fgowiki] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fgowiki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fgowiki] SET RECOVERY FULL 
GO
ALTER DATABASE [fgowiki] SET  MULTI_USER 
GO
ALTER DATABASE [fgowiki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fgowiki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fgowiki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fgowiki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fgowiki] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'fgowiki', N'ON'
GO
ALTER DATABASE [fgowiki] SET QUERY_STORE = OFF
GO
USE [fgowiki]
GO
/****** Object:  Table [dbo].[class]    Script Date: 2018/12/18 23:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[class] [varchar](50) NOT NULL,
	[intro] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[own]    Script Date: 2018/12/18 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[own](
	[id] [varchar](10) NOT NULL,
	[sid] [int] NOT NULL,
 CONSTRAINT [PK_own] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[search]    Script Date: 2018/12/18 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servents]    Script Date: 2018/12/18 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servents](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](50) NOT NULL,
	[class] [varchar](50) NULL,
	[starnum] [int] NOT NULL,
	[skill1] [varchar](50) NOT NULL,
	[skill2] [varchar](50) NOT NULL,
	[skill3] [varchar](50) NOT NULL,
	[zhenying] [nvarchar](50) NOT NULL,
	[buster] [int] NOT NULL,
	[art] [int] NOT NULL,
	[quick] [int] NOT NULL,
	[story] [nvarchar](300) NOT NULL,
	[bjname] [nvarchar](50) NOT NULL,
	[color] [varchar](10) NOT NULL,
	[bjs1] [nvarchar](100) NOT NULL,
	[bjs2] [nvarchar](100) NULL,
	[bjs3] [nvarchar](100) NULL,
	[bjs4] [nvarchar](100) NULL,
	[hp] [int] NOT NULL,
	[atk] [int] NOT NULL,
 CONSTRAINT [PK_servents] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[skill]    Script Date: 2018/12/18 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skill](
	[name] [varchar](50) NOT NULL,
	[effect] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_skill_1] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2018/12/18 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [varchar](10) NOT NULL,
	[password] [varchar](32) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Alterego', N'天生拥有名为id_es的特殊能力，是在违法改造下从既有技能变质、强化而成，表现出Alterego的精神性质。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Archer', N'以宝具的强大为特长的职阶，条件并非能力值的高低,作为侦察兵的素质也很高。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'assassin', N'全体成员均没有作为英雄的辉煌传说，因此能力值低下。拥有【气息遮断】作为职阶技能。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Avenger', N'职阶的符合条件不明，个人阵营会固定为【恶】，神性大幅下降或消失，性格也被改变。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Berserker', N'曾在战斗中疯狂的英雄适合此阶位,“狂化”会以剥夺理性为交换。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Caster', N'合适条件只有魔术的能力值达至最高等级。由于这个特性，符合的英灵的战斗能力都较低。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Lancer', N'全体能力值优秀，并且敏捷必须要高。理所当然，要擅长发挥枪击范围和速度的一击脱离战法。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'MoonCancer', N'月之癌(月之蝶)/游戏主持者')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Rider', N'具有与某个乘坐物(不只限于生物)有渊源的传说的英灵,有能力值比三骑士低的倾向。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Ruler', N'在死前无愿望的英雄才具备成为Ruler的条件,Ruler会保留参加圣杯战争的记忆。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Saber', N'符合的英灵自然要有与剑士相称的传说，亦被要求魔力以外的能力值皆为最高等级。')
INSERT [dbo].[class] ([class], [intro]) VALUES (N'Shielder', N'适性的英灵必定持有用于守护的宝具。')
INSERT [dbo].[own] ([id], [sid]) VALUES (N'admin', 1)
INSERT [dbo].[own] ([id], [sid]) VALUES (N'admin', 4)
INSERT [dbo].[own] ([id], [sid]) VALUES (N'admin', 5)
INSERT [dbo].[own] ([id], [sid]) VALUES (N'admin', 7)
INSERT [dbo].[own] ([id], [sid]) VALUES (N'admin', 11)
INSERT [dbo].[own] ([id], [sid]) VALUES (N'admin', 34)
SET IDENTITY_INSERT [dbo].[search] ON 

INSERT [dbo].[search] ([id], [content]) VALUES (1, N'吉尔')
INSERT [dbo].[search] ([id], [content]) VALUES (2, N'尼禄')
INSERT [dbo].[search] ([id], [content]) VALUES (3, N'艾塔')
INSERT [dbo].[search] ([id], [content]) VALUES (4, N'齐格飞')
INSERT [dbo].[search] ([id], [content]) VALUES (5, N'武')
INSERT [dbo].[search] ([id], [content]) VALUES (6, N'伊丽莎白')
INSERT [dbo].[search] ([id], [content]) VALUES (8, N'玛修')
INSERT [dbo].[search] ([id], [content]) VALUES (9, N'ddd')
INSERT [dbo].[search] ([id], [content]) VALUES (10, N'23')
INSERT [dbo].[search] ([id], [content]) VALUES (15, N'阿')
INSERT [dbo].[search] ([id], [content]) VALUES (16, N'sdfghg')
INSERT [dbo].[search] ([id], [content]) VALUES (18, N'阿塔兰忒')
INSERT [dbo].[search] ([id], [content]) VALUES (19, N'土方')
INSERT [dbo].[search] ([id], [content]) VALUES (20, N'阿尔托')
INSERT [dbo].[search] ([id], [content]) VALUES (21, N'')
INSERT [dbo].[search] ([id], [content]) VALUES (22, N'阿尔托')
INSERT [dbo].[search] ([id], [content]) VALUES (28, N'')
INSERT [dbo].[search] ([id], [content]) VALUES (29, N'')
INSERT [dbo].[search] ([id], [content]) VALUES (30, N'玛丽')
INSERT [dbo].[search] ([id], [content]) VALUES (31, N'玛')
INSERT [dbo].[search] ([id], [content]) VALUES (32, N'阿尔')
INSERT [dbo].[search] ([id], [content]) VALUES (33, N'阿尔托')
INSERT [dbo].[search] ([id], [content]) VALUES (11, N'玛')
INSERT [dbo].[search] ([id], [content]) VALUES (12, N'玛')
INSERT [dbo].[search] ([id], [content]) VALUES (13, N'ddd')
INSERT [dbo].[search] ([id], [content]) VALUES (14, N'卫')
INSERT [dbo].[search] ([id], [content]) VALUES (17, N'阿尔托莉雅')
INSERT [dbo].[search] ([id], [content]) VALUES (23, N'阿尔')
INSERT [dbo].[search] ([id], [content]) VALUES (24, N'')
INSERT [dbo].[search] ([id], [content]) VALUES (25, N'新宿')
INSERT [dbo].[search] ([id], [content]) VALUES (26, N'尼禄')
INSERT [dbo].[search] ([id], [content]) VALUES (27, N'')
SET IDENTITY_INSERT [dbo].[search] OFF
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (1, N'玛修·基列莱特', N'Shielder', 4, N'荣光不败的雪花之壁', N'时为朦胧的白亚之壁', N'意为奋进的决断之盾', N'秩序 · 善', 2, 2, 1, N'迦勒底局员，玛修·基列莱特，是与“Servant”凭依融合的姿态。被称作为“Demi·Servant（半从者）”', N'如今仍是遥远的理想之城', N'Art', N'己方全体防御力提升<超蓄力效果提升>（3回合)', N'赋予受到伤害减免状态<宝具升级效果提升>（3回合)', N'自身除外的己方全体攻击力提升（3回合)', NULL, 16609, 11565)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (2, N'阿尔托莉雅·潘德拉贡', N'Saber', 5, N'领导力', N'魔力放出', N'光辉之路', N'秩序 · 善', 2, 2, 1, N'不列颠传说中的王，被称为骑士王。阿尔托莉雅是幼名，从成为王的那一天起就被称为亚瑟王。在那个骑士道如花般凋零的时代，用手中的圣剑为不列颠带来了短暂的和平与最后的繁荣。虽然史实上是男性，但在这个世界似乎是男装的丽人。', N'誓约胜利之剑', N'Buster', N'对敌方全体进行强力的攻击', N'自身NP值的重蓄力<超蓄力效果提升>', NULL, NULL, 17587, 13273)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (3, N'阿尔托莉雅·潘德拉贡（Alter）', N'Saber', 4, N'魔力放出', N'直感', N'领导力', N'秩序 · 恶', 2, 2, 1, N'被圣杯的诅咒侵蚀，骑士王那冷酷无情的另一面。也许，有的只是作为亚瑟王追求的“理想的王”这一样事物。平常的阿尔托莉雅在约束、控制自己的力量，而这个状态的她却毫不犹豫地展现自己强大的魔力。', N'誓约胜利之剑', N'Buster', N'对敌方全体进行非常强力的攻击<宝具升级效果提升>', N'自身的NP值少许重蓄力<超蓄力效果提升>', NULL, NULL, 15041, 13398)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (4, N'阿尔托莉雅·潘德拉贡（Alter）', N'Saber', 4, N'直感', N'魔力放出', N'花之旅途', N'秩序 · 善', 2, 2, 1, N'拔出选定之剑Caliburn，刚刚开始在王者之路上前行的阿尔托莉雅的姿态。还是个半吊子的少女骑士。外貌看起来像是一朵令人怜爱的百合，而且那瞳孔中还充满希望的光辉。为了磨练经验而前往全国各地经历了许多事情，留下了许多冒险故事，被她帮助过的人从她这样活跃开始就称赞她为骑士姬。', N'必胜黄金之剑', N'Buster', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'自身的HP大量回复<超蓄力效果提升>', NULL, NULL, 13870, 10345)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (5, N'尼禄·克劳狄乌斯', N'Saber', 4, N'头痛', N'皇帝特权', N'纵使三度迎接夕阳', N'混沌 · 善', 2, 2, 1, N'自称是男装的丽人。既自我至上主义又自私任性，明朗豁达，像小孩子一样天真无邪、被万人爱戴的无所不能恣意妄为的皇帝。本名，尼禄・克劳狄乌斯・凯撒・奥古斯都・日耳曼尼库斯。罗马帝国的第5代皇帝。生涯被涂上谋略与毒之色彩的恶名昭彰的暴君。', N'童女讴歌如花帝政', N'Art', N'对敌方全体进行强力的无视防御力的攻击<宝具升级效果提升>', N'防御力下降（1回合）<超蓄力效果提升>', NULL, NULL, 15240, 12431)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (6, N'齐格飞', N'Saber', 4, N'黄金律', N'回归初始', N'屠龙者', N'混沌 · 善', 2, 2, 1, N'《尼伯龙根之歌》所颂扬的万夫莫当之英雄。是以圣剑巴尔蒙格诛杀了邪龙法布尼尔的“屠龙者”。其虽沉默寡言，却也是情深意重之人，常常在战场先头冲锋陷阵，守护战友。', N'幻想大剑・天魔失坠', N'Buster', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'对[龙]进行特攻攻击<超蓄力威力提升>', N'自身NP获得量提升（3回合）', NULL, 18165, 10895)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (7, N'盖乌斯·尤里乌斯·凯撒', N'Saber', 3, N'军略', N'领导力', N'煽动', N'中立 · 中庸', 2, 1, 2, N'古罗马最伟大的英雄之一。其人是以高卢战争和不列颠远征的大将身份而名扬四海的卓越统治者。英语中的叫法是西萨。作为女神维纳斯的末裔，他同样也是个连非人的妖精都会染指的帅哥。', N'黄之死', N'Quick', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'获得星星<超蓄力效果提升>', NULL, NULL, 13999, 11136)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (8, N'阿提拉', N'Saber', 5, N'军略', N'天性的肉体', N'星之纹章', N'混沌 · 善', 2, 2, 1, N'成就了大帝国的伟大王者，阿提拉。匈奴的末裔，被拥为王的匈族战士。制霸了从西亚、俄罗斯、东欧到高卢的广大版图的五世纪的大英雄。据说是她招来了东西罗马帝国的灭亡。', N'军神之剑', N'Buster', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'防御力下降（3回合）<超蓄力效果提升>', NULL, NULL, 16226, 14501)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (9, N'吉尔·德·雷', N'Saber', 3, N'军略', N'黄金律', N'普勒拉蒂的激励', N'秩序 · 善', 2, 2, 1, N'身高／体重：186cm・91kg。出典：史实地区：法国。属性：秩序・善 性别：男性。皮包骨型骨感美男子。这是还没有那么疯狂的年龄。', N'圣旗之下集结的吼声', N'Art', N'自身攻击力大幅度提升（2回合）<宝具升级效果提升>', N'获得星星<超蓄力效果提升>', N'自身防御力大幅度下降（3回合）【副作用】', NULL, 15224, 9942)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (10, N'骑士迪昂', N'Saber', 4, N'心眼（真）', N'自我暗示', N'美丽的风貌', N'中立 · 中庸', 2, 2, 1, N'被人传言为既是女性又是男性的十八、九世纪法国的传说人物。文武双全的剑士与文学家。作为间谍活跃于与各列强为敌的机密局，还曾担任过全权公使、龙骑兵连队长等职务。', N'绚烂绽放的百合花', N'Art', N'给敌方全体一定概率赋予魅惑状态（1回合）<超蓄力效果提升>', N'攻击力下降（3回合）<宝具升级效果提升>', N'防御力下降（3回合）<宝具升级效果提升>', NULL, 17063, 11603)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (11, N'卫宫', N'Archer', 4, N'心眼（真）', N'鹰之瞳', N'投影魔术', N'中立 · 中庸', 1, 3, 1, N'由于不是和其他英灵一样出自典故，不能被称为正统的英灵。由于这个英灵被称为守护者，所以它就像是由人类“应该存活下去”这个集体无意识中诞生出的像是防卫装置的东西。这个防卫装置所在的那一方被称为人类立场的抑止力，要点在于要选择没有名字的人们，没有知名度的正义的代理人。', N'无限剑制', N'Buster', N'对敌方全体进行强力无视防御力的攻击<宝具升级效果提升>', N'攻击力下降（3回合）<超蓄力效果提升>', NULL, NULL, 14959, 12369)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (12, N'吉尔伽美什', N'Archer', 5, N'领导力', N'黄金律', N'巴比伦的宝藏', N'混沌 · 善', 2, 2, 1, N'公元以前统治着苏美尔的都市国家乌鲁克的半神半人的王者。不仅仅是传说而是真实存在的人物，记述于人类最古的叙事诗《吉尔伽美什叙事诗》中的王。', N'天地乖离开辟之星', N'Buster', N'自身的宝具威力提升（1回合）', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'对[从者]特攻（对持有特别的星之力的从者无效）<超蓄力威力提升>', NULL, 15338, 14432)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (13, N'罗宾汉', N'Archer', 3, N'破坏工作', N'黄金律', N'五月之王', N'中立 · 善', 1, 2, 2, N'无貌无名的义贼。也就像他本人说的那样，这个青年只不过是作为罗宾汉的许多“某人”的其中一人而已，大多数的传说都是从他作为潜入舍伍曼森林的义贼之后开始的。最初的罗宾汉曾经抵抗暴君约翰王，但据说在柯克利思（Kirklees）修道院中因为修道院长的阴谋而出血过多死亡了。', N'祈祷之弓', N'Art', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'[毒]特攻<超蓄力效果提升>', NULL, NULL, 14802, 10078)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (14, N'阿塔兰忒', N'Archer', 4, N'跨越阿卡迪亚', N'追猎的美学', N'狩猎卡莱敦的野猪', N'中立 · 恶', 1, 2, 2, N'希腊神话登场的著名女猎人。因在狩猎卡吕冬野猪的过程中最先射中野猪而扬名。此外，她也是希腊豪杰云集的阿尔戈众英雄中的一员。', N'诉状的箭书', N'Quick', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'获得星星<超蓄力效果提升>', NULL, NULL, 16117, 11443)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (15, N'尤瑞艾莉', N'Archer', 3, N'吸血', N'魅惑的美声', N'女神的变化无常', N'混沌 · 善', 1, 2, 2, N'希腊神话中的戈耳工三姐妹的次女。男性憧憬的具现化，完成的作为“偶像”“理想的女性”生成的堕落的女神。集无垢与纯粹为一身的美丽少女。姐姐是斯忒诺，妹妹是美杜莎。', N'女神的视线', N'Art', N'对敌方单体[男性]特攻攻击<宝具升级效果提升>', N'高概率赋予魅惑状态[男性限定]（1回合）<超蓄力效果提升>', N'对敌方单体进行超强力的攻击', N'敌方攻击力下降（3回合）', 13879, 10507)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (16, N'阿拉什', N'Archer', 1, N'顽健', N'千里眼', N'弓矢作成', N'混沌 · 中庸', 2, 2, 1, N'古代波斯传说中的大英雄。其人是被称作西亚神代最后之王的麦努切赫尔麾下的战士，并终结了波斯与图尔库六十年的大战。可谓是为两国的人民送上了平稳与安宁的救世勇者。', N'流星一条', N'Buster', N'对敌方全体进行超强力的攻击<宝具升级效果提升>', N'对敌方全体进行超强力的攻击<超蓄力威力提升>', N'自身即死效果【副作用】', NULL, 11969, 10027)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (17, N'库·丘林', N'Lancer', 3, N'战斗续行', N'避矢的加护', N'回归初始', N'秩序 · 中庸', 2, 1, 2, N'爱好装饰，喜欢狂野自由的战斗的枪兵。是个如果为了工作封口的需要连一般人都会杀害的无情的人物，但是另一方面抛开工作的话却显出清新的气质。是个很会照顾人的大哥哥。', N'刺穿死棘之枪', N'Quick', N'赋予自身必中状态（1回合）', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'防御力下降（3回合）<超蓄力效果提升>', N'中等概率即死效果<超蓄力效果提升>', 13997, 10787)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (18, N'伊丽莎白·巴陶里', N'Lancer', 4, N'嗜虐的领导力', N'拷问技术', N'战斗续行', N'混沌 · 恶', 2, 1, 2, N'吸血鬼卡米拉的原型的血之伯爵夫人。……但是，作为从者被召唤的是她尚未犯下罪行之前十四岁的姿态。自称偶像的甜食系从者。道、残忍、无情，但其实并不像传说里一样惨无人道。', N'鲜血魔娘', N'Buster', N'对敌方全体进行强力的无视防御力的攻击<宝具升级效果提升>', N'赋予[诅咒]状态（3回合）<超蓄力效果提升>', N'强化成功率下降（3回合）', NULL, 15382, 12035)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (19, N'武藏坊弁庆', N'Lancer', 2, N'怨灵调伏', N'仁王立', N'白纸的劝进帐', N'混沌 · 善', 1, 2, 2, N'曾与源义经一同大展身手，日本史上最著名的僧兵。即便是现代，歌舞伎和净琉璃中大手笔的故事也还是为人喜爱。有关弁庆的仁王立和他的哭泣之所，直到现在，还有相当数量的往事在流传。', N'五百罗汉补陀落渡海', N'Art', N'给敌方全体一定概率赋予眩晕状态<宝具升级效果提升>', N'赋予[诅咒]状态（3回合）<超蓄力效果提升>', NULL, NULL, 14194, 9396)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (20, N'库·丘林（Prototype）', N'Lancer', 3, N'符文魔术', N'避矢的加护', N'兽杀者', N'秩序 · 中庸', 2, 1, 2, N'在凯尔特、阿尔斯特传说中存在的无双的大英雄，既是接受太阳神鲁格之血的“光之御子”，也别名为库兰的猎犬。虽与被同一个真名召唤的Lancer是同一个人物——肉体与精神，与“那一位”相比都较为年轻。', N'贯穿之朱枪', N'Quick', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'防御力下降（3回合）<超蓄力效果提升>', N'中等概率即死效果<超蓄力效果提升>', NULL, 14681, 10574)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (21, N'列奥尼达斯一世', N'Lancer', 2, N'殿军的矜持', N'战斗续行', N'战士的雄叫', N'秩序 · 中庸', 2, 1, 2, N'斯巴达教育这一词汇的语源地，斯巴达之王。以岌岌三百人之躯对抗波斯十万大军的温泉关战役而为人所知。', N'炎门的守护者', N'Buster', N'自身防御力大幅度提升（3回合）<超蓄力效果提升>', N'赋予自身目标集中状态（3回合)', N'获得星星<宝具升级效果提升>', NULL, 12476, 10529)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (22, N'罗穆路斯', N'Lancer', 3, N'天性的肉体', N'皇帝特权', N'七座丘陵', N'混沌 · 中庸', 2, 1, 2, N'古代罗马建国神话中登场的开国英雄。军神马尔斯与美丽的公主西尔维娅所生，与被当作神兽的狼为友被养育长大。合并了地中海周边国家，构筑了永恒荣光的大罗马帝国的基础的建国之王，真红的神祖。', N'万物皆由我枪生', N'Buster', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'己方全体攻击力提升（3回合）<超蓄力效果提升>', NULL, NULL, 14390, 10787)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (23, N'美杜莎', N'Rider', 3, N'魔眼', N'怪力', N'鲜血神殿', N'混沌 · 善', 1, 2, 2, N'希腊神话登场的戈耳工三姐妹的幺妹。本来是本土的地母神，因为奥林匹斯众神的策略和人们的狂信而逃到无形的岛屿上生存。被描述为能把看到的东西变为石头的蛇妖。', N'骑英之缰绳', N'Quick', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'暴击发生率下降（3回合）', N'己方全体星星发生率提升（3回合）<超蓄力效果提升>', NULL, 13107, 10734)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (24, N'圣乔治', N'Rider', 2, N'守护骑士', N'殉教者之魂', N'战斗续行', N'秩序 · 善', 1, 2, 2, N'圣乔治（Georgius），又叫圣乔治（George）。以持圣剑阿斯卡隆退治了巨龙的逸话而出名。骑乘着只有一次能够使对手的攻击无效化的爱马贝亚德（Bayard）。', N'力绝的祝福之剑', N'Art', N'赋予敌方单体[龙]特性（3回合）', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'自身防御力大幅度提升（1回合）<超蓄力效果提升>', NULL, 14268, 8577)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (25, N'爱德华·蒂奇', N'Rider', 2, N'暴风航海者', N'海贼的荣誉', N'绅士般的爱', N'混沌 · 恶', 2, 2, 1, N'恐怕是世界上最有名的大海盗，作为海贼的印象早已根深蒂固的大恶徒。将加勒比海置于自己的支配下，沉溺于美酒、女人与暴力，将巨大的财富掌握在手中。', N'安妮女王的复仇', N'Buster', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'低概率减少1格蓄力<超蓄力效果提升>', N'获得星星', NULL, 12401, 9957)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (26, N'布狄卡', N'Rider', 3, N'对女神的誓约', N'战斗续行', N'安德拉斯塔的加护', N'中立 · 善', 1, 2, 2, N'一世纪时，古代不列颠年轻的战斗女王。罗马帝国无情的侵略甚至令她的女儿们都被凌辱，无法忍受的她最终率领诸王发动了叛乱，但在皇帝尼禄的军势之下失败而丧命。后来，不列颠就流传起了“胜利女王”的传说。', N'无以约定守护的车轮', N'Art', N'己方全体防御力提升（3回合）<宝具升级效果提升>', N'防御力大幅度提升（1回合）<超蓄力效果提升>', N'攻击力提升（3回合）<超蓄力效果提升>', NULL, 14725, 9501)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (27, N'牛若丸', N'Rider', 3, N'天狗的兵法', N'领导力', N'燕之神技', N'混沌 · 中庸', 1, 2, 2, N'日本可谓无人不知无人不晓的悲运武将。与天赋异禀、受人拥戴的哥哥赖朝疏远，最后与从者弁庆一同被打倒。牛若丸是源义经的幼名。', N'坛之浦・八艘跳', N'Quick', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'自身星星发生率大幅度提升<超蓄力效果提升>', NULL, NULL, 13230, 10566)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (28, N'亚历山大', N'Rider', 3, N'领导力', N'红颜的美少年', N'霸王之兆', N'中立 · 善', 1, 2, 2, N'公元前四世纪，马其顿王国年轻的王子。既是绝世的美少年，也是被以亚里士多德为首的贤者们首肯的天才，是个真心热爱着史诗《伊利亚特》的天真小孩。可称之为可能性的具现一般的存在。', N'起始的蹂躏制霸', N'Quick', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'获得星星<超蓄力效果提升>', NULL, NULL, 12704, 10945)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (29, N'玛丽·安托瓦内特', N'Rider', 4, N'魅惑的美声', N'美丽的公主', N'神之恩宠', N'秩序 · 善', 1, 2, 2, N'身负哈布斯堡家的系谱的法国王妃。十八世纪路易十六的妃子，梦幻般的贵妇人。是欧洲世界的“以高贵进行支配”的象征般的存在。在王权的绝对性逐渐丧失的时代的奔流中，在世界发生变化之前殒命。', N'存于百合王冠之中的荣光', N'Quick', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'己方全体HP回复<超蓄力效果提升>', N'解除弱体状态', N'暴击威力提升（3回合）', 15962, 11031)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (30, N'玛尔达', N'Rider', 4, N'信仰的加护', N'奇迹', N'圣女的誓约', N'秩序 · 善', 1, 3, 1, N'镇服了恶龙塔拉斯克的一世纪的圣女。与妹妹和弟弟一起被传颂，成为人们信仰的救世主。拥有美丽的容貌，热情洋溢，完美无缺的人。——连恐怖的怪兽都为之倾倒的神圣的少女。', N'不觉爱的悲哀之龙啊', N'Buster', N'自身的Buster卡提升（1回合）', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'防御力大幅度下降（3回合）<超蓄力效果提升>', NULL, 16835, 10693)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (31, N'美狄亚', N'Caster', 3, N'高速神言', N'金羊皮', N'喀耳刻的教诲', N'中立 · 恶', 1, 3, 1, N'拥有金羊毛皮的埃厄忒斯王的女儿，被月之女神赫卡忒教授魔术，因为英雄伊阿宋从国家离开，由于长期流浪的结果被刻上背叛的魔女的烙印而离世。', N'万符必将破戒', N'Art', N'对敌方单体进行强力的攻击<宝具升级效果提升>', N'敌方单体强化全解除', N'自身的NP重蓄力<超蓄力效果提升>', NULL, 12709, 11029)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (32, N'吉尔·德·雷', N'Caster', 3, N'精神污染', N'艺术审美', N'深渊的邪视', N'混沌 · 恶', 1, 3, 1, N'15世纪法国的贵族。在自己的领地反复实施着将附近的少年接二连三地绑架并加以凌辱、残杀的恶行，作为后世的童话“蓝胡子”的原型而为人所知。', N'螺湮城教本', N'Buster', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'攻击力下降（3回合）<超蓄力效果提升>', NULL, NULL, 13879, 9806)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (33, N'汉斯·克里斯蒂安·安徒生', N'Caster', 2, N'人类观察', N'高速咏唱', N'无辜的怪物', N'秩序 · 中庸', 1, 3, 1, N'世界三大童话作家之一。《人鱼公主》《卖火柴的小女孩》似乎无人不知无人不晓。1805年出生，1875年死于肝癌。现在被称为三大作家之一，其半生充满挫折与苦恼。', N'为你写的故事', N'Art', N'一定概率提升己方全体攻击力、防御力、掉星率（3回合）<超蓄力效果提升>', N'提升概率<宝具升级效果提升>', N'赋予己方全体每回合HP回复状态（3回合）<超蓄力效果提升>', NULL, 13234, 9334)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (34, N'威廉·莎士比亚', N'Caster', 3, N'附魔', N'自我保存', N'国王一座', N'中立 · 中庸', 1, 3, 1, N'威廉?莎士比亚毫无疑问是全世界扬名的一个剧作家及演员，英国文学史上灿然闪光的这个名字，在英国的伟人中的知名度也是最高的。', N'开演之时已到，献上如雷的喝彩', N'Buster', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'低概率赋予眩晕状态<超蓄力效果提升>', NULL, NULL, 12651, 9392)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (35, N'梅菲斯托费勒斯', N'Caster', 3, N'咒术', N'无辜的怪物', N'道化的大笑', N'混沌 · 恶', 1, 3, 1, N'啊啊，恶魔！恶魔！恶魔来啦！！是梅菲斯托费勒斯啊！是那个最恐怖的恶魔啊！', N'微酣爆弹', N'Buster', N'对敌方全体进行无视防御力的强力攻击<宝具升级效果提升>', N'中概率赋予[诅咒]状态（3回合）<超蓄力效果提升>', NULL, NULL, 13485, 10245)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (36, N'沃尔夫冈·阿马多伊斯·莫扎特', N'Caster', 1, N'音乐神的加护（伪）', N'艺术审美', N'小小的夜之曲', N'中立 · 善', 1, 3, 1, N'举世可数的同时作为天才作曲家的演奏家，拥有可以说达到异常的音乐感和无可动摇的天才性，以多部乐曲残存于后世的十八世纪人物，被神宠爱的孩子，奇迹的天才。', N'为死神奏响的葬送曲', N'Art', N'一定概率降低敌方全体攻击力、防御力（3回合）<超蓄力效果提升>', N'降低概率<宝具升级概率提升>', N'赋予敌方全体[诅咒]状态（3回合）<超蓄力效果提升>', NULL, 11980, 9062)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (37, N'诸葛孔明〔艾尔梅洛伊二世〕', N'Caster', 5, N'鉴识眼', N'军师的忠言', N'军师的指挥', N'中立 · 善', 1, 3, 1, N'领主?艾尔梅洛伊二世并不像通常的从者一样具有背景丰富的器具和历史。但是由于牵扯到此次圣杯战争的特殊情况，利用依附自身肉体的方法将中国的英灵诸葛孔明成功地召唤了。', N'石兵八阵', N'Art', N'敌方全体防御力下降<宝具升级效果提升>', N'中概率赋予敌方眩晕状态<超蓄力效果提升>', N'赋予[诅咒]状态（6回合）', N'敌方全体的蓄气值减少1格', 16611, 12591)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (38, N'库·丘林', N'Caster', 3, N'原初的符文', N'避矢的加护', N'回归初始', N'秩序 · 中庸', 1, 3, 1, N'凯尔特神话阿尔斯特传说中的勇士。赤枝骑士团的一员也是阿尔斯特最强的战士，作为驱使着异界的盟主斯卡哈授予的魔枪的英雄的同时，也是从师傅那里继承了北欧魔术——卢恩符文的魔术师。', N'燃烧殆尽的炎之牢', N'Buster', N'自身的Buster卡性能提升（3回合）', N'对敌方全体进行强力的攻击<宝具升级效果提升>', N'防御力下降（3回合）<超蓄力效果提升>', N'赋予[灼伤]状态（10回合)<超蓄力效果提升>', 14012, 9895)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (39, N'佐佐木小次郎', N'Assassin', 3, N'心眼（伪）', N'透化', N'宗和的心得', N'中立 · 恶', 1, 1, 3, N'被传言为日本屈指可数的剑豪宫本武藏劲敌的剑士，年纪轻轻就在岩流岛登峰造极，所向无敌的天才剑士，虽说这样但是——', N'燕返', N'Quick', N'自身的Quick卡性能提升（3回合）', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'星星大量获得<超蓄力效果提升>', NULL, 10578, 9902)
INSERT [dbo].[servents] ([sid], [sname], [class], [starnum], [skill1], [skill2], [skill3], [zhenying], [buster], [art], [quick], [story], [bjname], [color], [bjs1], [bjs2], [bjs3], [bjs4], [hp], [atk]) VALUES (40, N'咒腕的哈桑', N'Assassin', 2, N'投掷／回收', N'自我改造', N'除风的加护', N'秩序 · 恶', 1, 1, 3, N'白色骷髅之暗杀者。其人为起源于中东的暗杀教团之首领。别名为“山中老人”的他，正是“Assassin”一词语源的尼查理（Nizari）派传说中头目的一位。山中老人历代共有十八名，据说每一位都是身怀绝技的大师。', N'妄想心音', N'Quick', N'对敌方单体进行超强力的攻击<宝具升级效果提升>', N'高概率即死效果<超蓄力效果提升>', NULL, NULL, 11950, 10090)
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'安德拉斯塔的加护', N'己方全体的Arts卡性能提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'巴比伦的宝藏', N'赋予自身星星集中状态（3回合），NP增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'霸王之兆', N'己方全体的Quick卡性能提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'白纸的劝进帐', N'赋予敌方全体宝具封印状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'暴风航海者', N'己方全体的宝具威力提升（1回合），攻击力提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'避矢的加护', N'赋予自身回避状态（3次）,防御力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'除风的加护', N'赋予自身回避状态（3次）,星星发生率提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'道化的大笑', N'赋予敌方单体强化无效状态（3次），赋予[诅咒]状态（5回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'殿军的矜持', N'赋予自身目标集中状态（1回合），NP获得量提升')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'对女神的誓约', N'赋予自身[罗马]特攻状态（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'符文魔术', N'自身的暴击威力提升（3回合）,弱体耐性提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'附魔', N'己方全体Buster卡性能提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'高速神言', N'自身的NP超大幅度增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'高速咏唱', N'获得大量NP')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'弓矢作成', N'自身NP增加，HP回复')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'怪力', N'自身的攻击力提升（2回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'光辉之路', N'自身的NP增加,获得大量星星')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'国王一座', N'己方单体的NP增加，星星发生率提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'海贼的荣誉', N'自身的攻击力提升（3回合），赋予自身毅力状态（1次·无限时），自身的弱体耐性降低50%（3回合）【副作用】')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'红颜的美少年', N'赋予敌方单体[人型]魅惑状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'花之旅途', N'己方全体NP获得量提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'皇帝特权', N'自身HP回复,60%几率自身的攻击力提升（3回合）,60%几率自身的防御力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'黄金律', N'自身的NP获得量增加（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'回归初始', N'解除自身弱体状态')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'鉴识眼', N'己方单体的暴击威力提升（3回合）,NP增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'金羊皮', N'回复自身大量HP')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'精神污染', N'自身的精神弱体赋予成功率提升（3回合）,精神弱体耐性提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'军略', N'己方全体的宝具威力提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'军师的指挥', N'己方全体的攻击力提升（3回合）,赋予造成伤害增加状态（3回合）,NP少许增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'军师的忠言', N'己方全体的防御力提升（3回合）,赋予受到伤害减免状态（3回合）,NP少许增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'喀耳刻的教诲', N'己方单体弱体状态解除,NP获得量提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'拷问技术', N'敌方单体的防御力下降（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'跨越阿卡迪亚', N'己方全体Quick卡性能提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'领导力', N'己方全体的攻击力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'美丽的风貌', N'赋予自身目标集中状态（3回合），HP大量回复')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'美丽的公主', N'赋予自身无敌状态（3次）,每回合HP回复状态（5回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'魅惑的美声', N'高概率赋予敌方单体[异性]魅惑状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'魔力放出', N'自身的Buster卡性能提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'魔眼', N'一定概率赋予敌方单体石化状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'女神的变化无常', N'自身的Arts卡性能提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'破坏工作', N'敌方全体的攻击力下降（3回合），赋予毒状态（5回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'普勒拉蒂的激励', N'自身的Buster卡性能提升（5回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'七座丘陵', N'赋予己方单体毅力状态（1次·1回合），Buster卡性能提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'奇迹', N'己方全体HP大量回复,解除弱体状态')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'千里眼', N'自身的星星发生率大幅度提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'人类观察', N'己方全体的暴击威力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'仁王立', N'赋予自身目标集中状态（1回合），大幅度提升的防御力（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'荣光不败的雪花之壁', N'己方全体的防御力提升（3回合），赋予受到伤害减免状态（1次）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'煽动', N'己方单体的暴击威力大幅度提升（3回合）,星星发生率提升（3回合）,防御力下降（3回合）【副作用】')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'绅士般的爱', N'己方全体HP恢复，自身除外己方全体[女性]的HP恢复')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'深渊的邪视', N'赋予敌方全体[恐怖]状态（5回合）<每回合一定概率赋予眩晕状态（1回合），只生效1次>')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'神之恩宠', N'自身的弱体赋予成功率提升（3回合）,HP大量回复')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'圣女的誓约', N'敌方单体强化状态解除,防御力下降（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'时为朦胧的白亚之壁', N'赋予己方单体无敌状态（1回合），NP增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'嗜虐的领导力', N'己方全体的攻击力提升（3回合），除自身外己方全体[女性]的攻击力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'守护骑士', N'赋予自身目标集中状态（3回合），防御力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'狩猎卡莱敦的野猪', N'赋予自身回避状态（1回合），NP获得量提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'兽杀者', N'赋予自身[猛兽]特攻状态（3回合）,星星集中度上升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'天狗的兵法', N'己方全体NP获得量提升（3回合）,自身的Quick卡性能提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'天性的肉体', N'自身的攻击弱体耐性提升（3回合）,HP大量回复,赋予自身星星集中状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'头痛', N'自身的精神耐性提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'投影魔术', N'自身的Arts卡性能提升（1回合），Quick卡性能提升（1回合），Buster卡性能提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'投掷／回收', N'获得星星,赋予自身回合结束时获得星星的状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'透化', N'解除自身精神异常状态,获得大量星星')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'屠龙者', N'赋予自身对[龙]特攻状态（3回合）,对[龙]防御力提升（3回合）,自身的Buster卡性能提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'顽健', N'自身的防御力提升（3回合），毒耐性提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'无辜的怪物', N'赋予自身每回合获得星星状态（3回合），防御力下降（3回合）【副作用】')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'五月之王', N'赋予自身必中状态（1回合），赋予自身回避状态（1回合），获得星星')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'吸血', N'敌方单体的蓄气值中等概率下降1格，自身NP增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'鲜血神殿', N'自身的NP增加20%，NP获得量提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'小小的夜之曲', N'星星大量获得')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'心眼（伪）', N'赋予自身回避状态（1回合）,暴击威力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'心眼（真）', N'赋予自身回避状态（1回合），防御力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'信仰的加护', N'自身的弱体耐性提升（3回合）,HP大量回复')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'星之纹章', N'自身的攻击力提升（3回合）,获得大量星星')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'殉教者之魂', N'自身的精神异常弱体耐性大幅度提升（3回合），HP回复')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'燕之神技', N'赋予自身回避状态（1回合）,星星发生率提高（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'艺术审美', N'敌方单体[从者]的宝具威力降低（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'意为奋进的决断之盾', N'赋予自身目标集中状态（1回合），NP获得量提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'音乐神的加护（伪）', N'己方全体Arts卡性能提升（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'鹰之瞳', N'自身的星星发生率提升（3回合），暴击威力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'原初的符文', N'自身的暴击威力提升（3回合）,弱体耐性提升（3回合）,NP增加')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'怨灵调伏', N'赋予敌方单体技能封印状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'战斗续行', N'赋予自身毅力状态（1次·5回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'战士的雄叫', N'己方全体的Buster卡性能提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'直感', N'获得大量星星')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'咒术', N'敌方单体的蓄气值中等概率下降1格')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'追猎的美学', N'赋予自身星星大幅度集中状态（1回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'自我暗示', N'解除自身弱体状态，弱体耐性大幅度提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'自我保存', N'赋予自身无敌状态（1回合）,HP回复')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'自我改造', N'自身的暴击威力提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'宗和的心得', N'赋予自身必中状态（3回合）,星星发生率提升（3回合）,星星集中度提升（3回合）')
INSERT [dbo].[skill] ([name], [effect]) VALUES (N'纵使三度迎接夕阳', N'赋予自身毅力状态（3次·5回合）')
INSERT [dbo].[users] ([id], [password]) VALUES (N'admin', N'21232F297A57A5A743894A0E4A801FC3')
ALTER TABLE [dbo].[own]  WITH CHECK ADD  CONSTRAINT [idFK] FOREIGN KEY([id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[own] CHECK CONSTRAINT [idFK]
GO
ALTER TABLE [dbo].[own]  WITH CHECK ADD  CONSTRAINT [sidFK] FOREIGN KEY([sid])
REFERENCES [dbo].[servents] ([sid])
GO
ALTER TABLE [dbo].[own] CHECK CONSTRAINT [sidFK]
GO
ALTER TABLE [dbo].[servents]  WITH CHECK ADD  CONSTRAINT [classFK] FOREIGN KEY([class])
REFERENCES [dbo].[class] ([class])
GO
ALTER TABLE [dbo].[servents] CHECK CONSTRAINT [classFK]
GO
ALTER TABLE [dbo].[servents]  WITH CHECK ADD  CONSTRAINT [skill1FK] FOREIGN KEY([skill1])
REFERENCES [dbo].[skill] ([name])
GO
ALTER TABLE [dbo].[servents] CHECK CONSTRAINT [skill1FK]
GO
ALTER TABLE [dbo].[servents]  WITH CHECK ADD  CONSTRAINT [skill2FK] FOREIGN KEY([skill2])
REFERENCES [dbo].[skill] ([name])
GO
ALTER TABLE [dbo].[servents] CHECK CONSTRAINT [skill2FK]
GO
ALTER TABLE [dbo].[servents]  WITH CHECK ADD  CONSTRAINT [skill3FK] FOREIGN KEY([skill3])
REFERENCES [dbo].[skill] ([name])
GO
ALTER TABLE [dbo].[servents] CHECK CONSTRAINT [skill3FK]
GO
USE [master]
GO
ALTER DATABASE [fgowiki] SET  READ_WRITE 
GO
