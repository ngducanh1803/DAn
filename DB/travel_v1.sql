/*
 Navicat Premium Data Transfer

 Source Server         : ONYX-3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : travel_v1

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 21/02/2022 20:59:18
*/
Drop database if exists travel_v1;
create database travel_v1;
use travel_v1;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for chitiettour
-- ----------------------------
DROP TABLE IF EXISTS `chitiettour`;
CREATE TABLE `chitiettour`  (
  `id_chitiet` int NOT NULL AUTO_INCREMENT,
  `id_tour` int NOT NULL,
  `ngaydi` datetime(0) NOT NULL,
  `ngayve` datetime(0) NOT NULL,
  `soluong` int NOT NULL,
  `ghichu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
--   `id` int ,
  PRIMARY KEY (`id_chitiet`) USING BTREE,
  INDEX `id_tour`(`id_tour`) USING BTREE,
--   INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `chitiettour_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`) ON DELETE RESTRICT ON UPDATE RESTRICT
--   CONSTRAINT `chitiettour_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chitiettour
-- ----------------------------
INSERT INTO `chitiettour` VALUES (1, 1, '2023-05-01 11:06:00', '2023-05-06 00:03:00', 24, 'Du lịch Miền Trung - Tour Du lịch Đà Nẵng được thiên nhiên đặc biệt ưu đãi, mảnh đất miền Trung đẹp với nhiều dãy núi hùng vỹ xanh rì, những bờ biển cát trắng mịn thoai thoải và những dòng sông trong vắt thơ mộng. Không những vậy, trên con đường di sản miền Trung cùng du lịch thanh tùng, du khách còn được thưởng ngoạn những di sản thế giới cuả Việt Nam đó là Phố cổ Hội An – nơi bến cảng một thời sầm uất nhất Đông Dương, quần thể di tích Cố Đô Huế với hệ thống đền đài lăng tẩm nguy nga tráng lệ và Động Phong Nha với nhiều hang động kì bí của tạo hóa..', 'cbang.jpg');
INSERT INTO `chitiettour` VALUES (2, 2, '2023-06-13 04:02:00', '2023-06-18 15:01:00', 25, 'Tour Hà Nội - Hạ Long - Sapa 5 Ngày 4 đêm là một hành trình kết hợp 3 địa điểm hấp dẫn và thu hút khách nhất của Miền bắc. Du khách cùng nồng nàn họa quyện vào không khí náo nhiệt nhưng cũng rất cổ kính tại Hà Nội Thủ Đô. Cùng Trải nghiệm cảm giác ngồi tàu ngắm nhìn kỳ quan thế giới Vịnh Hạ Long. Chinh phục nóc nhà nhà Fansipan. Quà nhiều điều hấp dẫn đang chờ đợi. Hãy cùng Du Lịch Sài Gòn Thành Công khám phá hành trình thú vị này nhé.', 'cau.jpg');
INSERT INTO `chitiettour` VALUES (3, 3, '2023-06-07 02:03:00', '2023-06-10 14:01:00', 24, 'Nha Trang - thành phố biển nổi tiếng, gây ấn tượng với bao người ngay từ tên gọi dịu dàng, thân thương. Tạo hóa đã ưu ái dành tặng cho phố biển tinh khôi tất cả nét đẹp của một vùng duyên hải, từ những bãi biển quyến rũ, trải dài, những bãi cát trắng mịn đến những hòn đảo ngoài khơi hoang sơ, những rạn san hô kỳ vỹ, muôn màu… Vậy nên đừng chần chừ đặt ngay tour du lịch Nha Trang và lên đường khám phá nhé. ', '2.jpg');
INSERT INTO `chitiettour` VALUES (4, 4, '2023-06-20 02:04:00', '2023-06-23 02:04:00', 25, 'Với vị trí địa lý đặc biệt – Cực Nam của Tổ quốc trên đất liền, du lịch Cà Mau từ lâu đã trở thành điểm đến thiêng liêng và hấp dẫn. Chương trình Tour Cà Mau đưa quý khách về Đất Mũi tận mắt ngắm nhìn nơi cuối cùng của đất phương Nam, tìm hiểu hệ sinh thái rừng ngập mặn phong phú, đa dạng ở Vườn quốc gia Mũi Cà Mau. Cùng Thám Hiểm MeKong trải nghiệm cuộc sống mưu sinh của người dân địa phương với các hoạt động như đi giỡ cua, mò sò, giăng lưới, soi ba khía…', 'cau.jpg');
INSERT INTO `chitiettour` VALUES (5, 5, '2023-06-14 02:03:00', '2023-06-18 14:02:00', 25, 'Tour Tiền Giang - Cần Thơ sẽ đưa bạn về với vùng quê sông nước của miền Tây Việt Nam. Bạn sẽ được tận hưởng không khí trong lành của vườn cây trái, hương phù sa từ dòng sông Mekong hiền hoà, hương lúa Việt Nam. Thưởng thức những món ngon của vùng hương đồng lúa nội.', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (6, 6, '2023-06-22 02:04:00', '2023-06-25 15:04:00', 9, 'Tour Tiền Giang - Cần Thơ sẽ đưa bạn về với vùng quê sông nước của miền Tây Việt Nam. Bạn sẽ được tận hưởng không khí trong lành của vườn cây trái, hương phù sa từ dòng sông Mekong hiền hoà, hương lúa Việt Nam. Thưởng thức những món ngon của vùng hương đồng lúa nội.', 'cau.jpg');
INSERT INTO `chitiettour` VALUES (7, 7, '2023-06-16 13:02:00', '2023-06-19 14:03:00', 24, 'Với Tour Miền Tây chỉ 4 ngày quý khách có thể khám phá trọn vẹn vùng sông nước miền Tây với các điểm đến hấp dẫn tại Cần Thơ, Sóc Trăng, Bạc Liêu và Cà Mau. Tham gia Tour Miền Tây: Cần Thơ – Bạc Liêu – Cà Mau quý khách trải nghiệm du thuyền trên sông Mekong huyền thoại, nghe đờn ca tài tử sâu lắng và sẽ được nghỉ ngơi thư giãn đúng nghĩa. ', 'cau.jpg');
INSERT INTO `chitiettour` VALUES (8, 8, '2023-06-22 04:02:00', '2023-06-25 14:03:00', 25, 'Nhắc đến Đà Lạt, du khách nghĩ ngay đến thành phố với một chút buồn, rất nên thơ và lãng mạn, thêm cái lành lạnh của thời tiết cuối năm đã mang lại vị trí vàng để du khách lựa chọn là điểm đến cùng bạn bè và người thân...', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (9, 9, '2023-06-22 15:01:00', '2023-06-25 03:04:00', 24, 'Miền Trung, dải đất thân thương nối liền hai miền Nam - Bắc của Việt Nam. “Cung đường di sản miền Trung” sẽ kết nối du khách với các di sản văn hóa của nhân loại được UNESCO công nhận bao gồm: Quảng Bình cùng Vườn quốc gia Phong Nha - Kẻ Bàng; Huế với hai di sản là Quần thể di tích Cố đô Huế và Nhã Nhạc cung đình; Quảng Nam với hai di sản là Thánh địa Mỹ Sơn và đô thị cổ Hội An. Trên mỗi bước đi, du khách còn có thể khám phá cho mình nhiều điểm đến hấp dẫn: Bà Nà Hill, Làng Chài Lăng Cô, …và nhiều bãi tắm tuyệt đẹp: Cửa Đại, Non Nước, Lăng Cô, Nhật Lệ…cùng với những nét ẩm thực độc đáo của Miền Trung. Cùng trải nghiệm cung đường tuyệt vời này ngay hôm nay!', 'cbang.jpg');
INSERT INTO `chitiettour` VALUES (10, 10, '2023-07-18 02:03:00', '2023-07-21 15:04:00', 24, 'Sapa từ lâu đã được khách du lịch gọi với cái tên đầy thân thương đó là “nơi gặp gỡ đất trời” hay “thị trấn sương mù”. Vậy tại sao nơi đây lại gây ấn tượng mạnh với khách du lịch trong và ngoài nước với vẻ đẹp của sương mù như vậy. Hãy cùng chiêm ngưỡng vẻ đẹp Sapa trong sương để thấy được vẻ đẹp huyền ảo và mộng mơ của thị trấn vùng cao Tây Bắc nổi tiếng này nhé! ', 'ctho.jpg');
INSERT INTO `chitiettour` VALUES (11, 11, '2023-07-20 02:03:00', '2023-07-23 14:04:00', 25, 'Hãy bỏ lại mọi bận rộn của cuộc sống thường ngày và tự thưởng cho bản thân một trải nghiệm ấn tượng tại Show Huyền Thoại Làng Chài Phan Thiết nào! Đến với sân khấu kịch nhạc nước với qui mô hơn 1.500 chỗ ngồi, bạn sẽ đắm chìm trước câu chuyện đầy cảm động về niềm tin biển cả và ước mơ của người dân làng chài Phan Thiết.', 'ckinhspa.jpg');
INSERT INTO `chitiettour` VALUES (12, 12, '2023-08-03 03:02:00', '2023-08-09 03:02:00', 23, 'Tour Lễ Hội Pháo Hoa Đà Nẵng - Huế ..............', 's1.jpg');
INSERT INTO `chitiettour` VALUES (13, 13, '2023-09-16 02:03:00', '2023-09-18 04:02:00', 23, 'Hành trình chinh phục vùng non nước hữu tình Đông Bắc và trải nghiệm trọn vẹn khoảnh khắc đất trời giao mùa tại vùng đất xinh đẹp này. Tour du lịch Đông Bắc sẽ là một lựa chọn tuyệt vời đưa quý khách tham quan và khám phá Hà Giang - Tuyệt tác vùng cao, vùng đất Cao Bằng - lịch sử in dấu và trải nghiệm những nét văn hóa độc đáo nơi đây,....', 'cbang.jpg');
INSERT INTO `chitiettour` VALUES (14, 14, '2023-08-21 02:03:00', '2023-08-24 15:02:00', 24, 'Combo Sapa 2 ngày khởi hành từ Hà Nội - Khách sạn 4 sao Sapa Charm Hotel..............', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (15, 15, '2023-08-23 03:02:00', '2023-08-25 14:03:00', 25, 'Xứ Bắc – vùng đất khai cơ của các Vương triều Việt, nơi định đô của hầu hết các triều đại phong kiến Việt Nam chính vì vậy nơi đây được xem như là đất kinh đô ngàn năm văn hiến với một bề dày văn hóa, lịch sử sâu sắc và đa dạng.', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (16, 16, '2023-08-30 03:53:00', '2023-09-03 14:03:00', 25, 'Du Lịch Miền Tây dịp lễ 2/9 - Xuôi về vùng đất Miền Tây Nam Bộ, du khách sẽ được trải nghiệm cuộc sống nơi những con rạch nhỏ xen kẽ rợp bóng dừa, háo hứng với chợ nổi nhộn nhịp ghe thuyền đầy ắp các loại trái cây miệt vườn, thưởng thức những món ăn đặc sản cá tai tượng chiên xù, uống nước dừa xiêm, nghe đờn ca tài tử và nhâm nhi chén trà mật ong thanh mát. Cùng Du lịch Việt trải nghiệm những đặc trưng nơi con người miền Tây sông nước mộc mạc thân thương qua hành trình ngắn 2 ngày 1 đêm.', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (17, 17, '2023-07-25 02:04:00', '2023-07-28 02:04:00', 25, 'Là hành trình cực kỳ ý nghĩa và cũng không kém phần thú vị. Với hành trình này du khách có dịp hành hương cầu bình an, may mắn tại những ngôi chùa nổi tiếng linh thiêng, tham quan và khám phá những địa danh nổi tiếng của Bạc Liêu, Sóc Trăng. Viếng Quan Âm Phật Đài Mẹ Nam Hải Bạc Liêu, một công trình văn hóa tâm linh nổi bật của tỉnh, với pho tượng Bồ Tát Quán Thế Âm hay người dân nơi đây còn gọi lại Mẹ Nam Hải Bạc Liêu cao 11 mét, đứng uy nghi giữa một không gian thoáng đãng hướng nhìn ra biển Đông.', 'ckinhspa.jpg');
INSERT INTO `chitiettour` VALUES (18, 18, '2023-06-22 02:04:00', '2023-06-26 02:04:00', 25, 'Đến với du lịch Phú Quốc, ngoài những điểm tham quan thuần túy như Dinh Cậu, Hàm Ninh, Suối Tranh, Bãi Sao, mua sắm ngọc trai, nước mắm, rượu Sim,… thì từ tháng 10 đến tháng 5 năm sau Hòn Mây Rút, Hòn Móng Tay lại là điểm đến nổi như cồn của giới trẻ hay những người đam mê khám phá những bãi biển đẹp, hoang sơ. Cùng Du Lịch Việt trải nghiệm hành trình tour thú vị, hấp dẫn này nhé.', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (19, 19, '2023-06-01 02:04:00', '2023-06-04 02:04:00', 25, 'Du Lịch Miền Bắc - Du khách sẽ hoàn toàn lạc trôi vào coi thiên đường chốn nhân gian với hành trình 4 ngày. Du khách sẽ bị hút vào ngút ngàn màu xanh của đồng ruộng và khám phá những nơi lưu giữ vẻ đẹp nguyên sơ các nếp nhà sàn, cùng nét thú vị độc đáo của con người, phong tục tập quán của người đồng bào. Thỏa sức khám phá cảnh núi đồi chập chùng, những dòng nước uốn lượn và những hang đá ẩn sâu phía dưới chân núi, đắm mình trong khung cảnh hữu tình, cầu tài cầu lộc cho cuộc sống bình an, gia đình hạnh phúc.', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (20, 20, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Lễ 30/4 - Tour Du lịch Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sapa từ Sài Gòn 2023. Tour Du lịch Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sa Pa từ Sài Gòn. Hành trình phương Bắc sẽ đưa du khách đến Hà Nội 36 phố phường, nếm đặc sản đất Hà Thành, chìm đắm trong nên thơ cảnh sắc núi rừng Yên Tử, cảm nhận không gian bao la hùng vĩ của Hạ Long, khám phá nét đặc sắc của văn hóa vùng cao nơi phố núi Sapa với mênh mông những thửa ruộng bậc thang xanh ngút ngàn và tìm hiểu đời sống văn hóa của đồng bào dân tộc – Đó là những gì mà du khách cảm nhận được trong 5 ngày 4 đêm, chương trình “Hà Nội – Yên Tử – Hạ Long – Lào Cai – Sapa” ', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (21, 21, '2023-06-29 02:04:00', '2023-07-03 02:04:00', 25, 'Quảng Bình là một trong các tỉnh miền Trung được thiên nhiên ưu ái khi sở hữu vườn Quốc gia Phong Nha - Kẻ Bàng có hệ thống hang động núi đá vôi, suối ngầm, sông ngầm đẹp bậc nhất thế giới. Do vậy mà không chỉ “Thiên Nam đệ nhất động” Phong Nha, khu vực vườn Quốc gia còn những hang động kỳ vĩ khác như động Thiên Đường, động Tiên Sơn, sông Chày hang Tối, suối Moọc với vẻ đẹp ấn tượn', 'cbang.jpg');
INSERT INTO `chitiettour` VALUES (22, 22, '2023-05-29 02:04:00', '2023-06-03 02:04:00', 25, 'Du lịch Hè - Tour Du lịch Quy Nhơn - Phú Yên từ Hà Nội 2023. Quy Nhơn – Thành phố trung tâm của Tỉnh Bình Định với bờ biển dài, chạy quanh thành phố, được đánh giá là một trong những bãi biển đẹp nhất Miền Trung. Với thành Đồ Bàn – Kinh đô cũ của đất nước Champa vẫn còn đó những nét vết tích cổ kính, rêu phong. Tháp Đôi, cụm kiến trúc Tháp Chăm đặc sắc độc đáo bậc nhất Bình Đình, nằm ẩn mình trong 1 thành phố năng động hiếu khách. Đến Quy Nhơn quý khách nhớ ghé viếng thăm Mộ của thi nhân Hàn Mặc Tử, một thi sĩ tài hoa mà bạc mệnh. Đến Quy Nhơn quý khách hãy 1 lần ghé qua quê hương của người Anh Hùng Áo Vải – Quang Trung Nguyễn Huệ. Nằm cách Tp Quy Nhơn khoảng 100km về phía nam, Tp Tuy Hòa vẫn khá mới lạ và còn nhiều nét hoang sơ trong bản đồ du lịch của nhiều du khách. Đến Tuy Hòa, quý khách nhất định phải ghé đến Gành Đá Đĩa – Thắng cảnh độc nhất vô nhị của Việt Nam, Gành Ông – Bãi Xép nơi ghi dấu của bộ phim “Tôi thấy hoa vàng trên cỏ xanh” nổi tiếng của Victo Vũ.', 'ctho.jpg');
INSERT INTO `chitiettour` VALUES (23, 23, '2023-08-01 02:04:00', '2023-08-06 02:04:00', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang từ Hà Nội 2023. Nha Trang, thành phố biển với cát trắng, quanh năm sóng vỗ rì rào, được ví như Địa Trung Hải của Việt Nam. Đến Nha Trang, du khách không chỉ được tận hưởng những ngày nghỉ biển tuyệt vời bên bờ biển trải dài, bầu trời xanh ngắt… mà du khách còn được trải nghiệm những dịch vụ vui chơi giải trí đẳng cấp hàng đầu Việt Nam.', 'cbang.jpg');
INSERT INTO `chitiettour` VALUES (24, 24, '2023-09-29 02:04:00', '2023-10-03 02:04:00', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang bay Bamboo Airways từ Hà Nội 2023. Nha Trang, thành phố biển với cát trắng, quanh năm sóng vỗ rì rào, được ví như Địa Trung Hải của Việt Nam. Đến Nha Trang, du khách không chỉ được tận hưởng những ngày nghỉ biển tuyệt vời bên bờ biển trải dài, bầu trời xanh ngắt… mà du khách còn được trải nghiệm những dịch vụ vui chơi giải trí đẳng cấp hàng đầu Việt Nam. ', 'ckinhspa.jpg');
INSERT INTO `chitiettour` VALUES (25, 25, '2023-03-01 02:04:00', '2023-03-05 02:04:00', 25, 'Du lịch Hè Tour Du lịch Quy Nhơn - Tuy Hòa - Quy Nhơn từ Hà Nội 2023. Quy Nhơn – Thành phố trung tâm của Tỉnh Bình Định với bờ biển dài, chạy quanh thành phố, được đánh giá là một trong những bãi biển đẹp nhất Miền Trung. Với thành Đồ Bàn – Kinh đô cũ của đất nước Champa vẫn còn đó những nét vết tích cổ kính, rêu phong. Tháp Đôi, cụm kiến trúc Tháp Chăm đặc sắc độc đáo bậc nhất Bình Đình, nằm ẩn mình trong 1 thành phố năng động hiếu khách. Đến Quy Nhơn quý khách nhớ ghé viếng thăm Mộ của thi nhân Hàn Mặc Tử, một thi sĩ tài hoa mà bạc mệnh', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (26, 26, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Hè Tour Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Đất Mũi - Châu Đốc từ Hà Nội 2023. Tạo hóa đã ban tặng cho miền Tây cái đẹp mộc mạc mà nên thơ, với những cánh đồng xanh bát ngát, những miệt vườn sai quả, những ngả đường trĩu nặng phù sa. Đặc biệt, du khách sẽ được xuôi về miền sang nước hữu tình này để chu du, thưởng ngoạn và trải nghiệm những điều bình dị, chân phương.', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (27, 27, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Hè Tour Du lịch Phú Quốc Khám phá Đảo Ngọc từ Hà Nội 2023. Du lịch Phú Quốc Khám phá Grand World Phú Quốc là một dự án siêu khủng tái hiện những công trình của thế giới như: kênh đào Venice lãng mạn, công trình tre khổng lồ, bảo tàng gấu Teddy… Ngoài ra nơi đây còn có hàng loạt tiện ích mới được nâng cấp cùng chuỗi hoạt động nghệ thuật độc đáo và những sự kiện âm nhạc đặc sắc, quy mô “khủng” mang đến không khí lễ hội bất tận suốt 365 ngày/năm.', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (28, 28, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Hè - Tour Hà Nội - Sài Gòn - Mũi Né - Vũng Tàu từ Hà Nội 2023. Du lịch Mũi Né - Mũi Né là một mũi biển ở thành phố Phan Thiết, một trung tâm du lịch nổi tiếng của tỉnh Bình Thuận. tên gọi Mũi Né xuất phát từ ngư dân đánh cá. "Mũi" là cái mũi đất đưa ra biển lớn; "Né" có nghĩa là nơi tránh giông bão. Cùng Du Lịch Việt khám phá Mũi Né sẽ  đưa Quý khách tham quan, Lâu đài Vang RD trong khu nghỉ dưỡng Sealink: Tại đây, du khách có cảm giác trở về thời trung cổ của châu Âu với khu quảng trường rộng lớn, mái vòm cổ kính, trang nhã, sang trọng, và những tháp canh cao vút trải tầm nhìn ra không gian tươi xanh của Sea Links City và toàn vịnh Mũi Né', 'dnang.jpg');
INSERT INTO `chitiettour` VALUES (29, 29, '2023-04-30 02:04:00', '2023-04-30 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Hoa Lư - Tam Cốc 1 ngày từ Hà Nội 2023. Du lịch Ninh Bình - Ninh Bình một tỉnh thuộc Miền Bắc nước ta, cách thủ đô Hà Nội 90km về phía Nam. Đến với Tour du lịch Ninh Bình du khách sẽ được tham quan với nhiều danh lam thắng đẹp cả về cảnh quan và ý nghĩa lịch sử. Nơi đây đã trở thành nơi được nhiều du khách lựa chọn trong kỳ nghỉ dưỡng của mình. Ngoài ra, khi đi tour Ninh Bình, bạn còn có thể thưởng thức nhiều món ăn đặc sắc, tham gia nhiều lễ hội thú vị mà chỉ có thể bắt gặp ở vùng đất này. Hãy tham khảo các tour du lịch Ninh Bình đang được du lịch thanh tùng mở bán hàng tuần tại Website trực tuyến, để lựa chọn cho mình chuyến du lịch phù hợp nhé! ', 'cbang.jpg');
INSERT INTO `chitiettour` VALUES (30, 30, '2023-05-01 02:04:00', '2023-05-01 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Bái Đính - Tràng An 1 ngày từ Hà Nội 2023. Chùa Bái Đính là một quần thể chùa lớn với nhiều kỷ lục châu Á và Việt Nam được xác lập như chùa có tượng Phật bằng đồng dát vàng lớn nhất châu Á, chùa có hành lang La Hán dài nhất châu Á, có tượng Di lặc bằng đồng lớn nhất Đông Nam Á... Đây là ngôi chùa lớn nhất và sở hữu nhiều kỷ lục nhất ở Việt Nam. Các hạng mục xây dựng, mở rộng khu chùa mới được các đại biểu tham dự đại lễ Phật đản thế giới 2008 làm lễ khánh thành giai đoạn 1, năm 2010 chùa Bái Đính là nơi tổ chức Đại lễ cung nghinh xá lợi Phật đầu tiên từ Ấn Độ về Việt Nam.', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (31, 31, '2023-06-01 02:04:00', '2023-06-01 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Hương 1 ngày từ Hà Nội 2023. Chùa Hương hay còn gọi chùa Hương Tích, là một trong những ngôi chùa nổi tiếng bậc nhất miền Bắc bởi vị trí tọa lạc nơi non nước hữu tình với cảnh sắc thiên nhiên tuyệt đẹp. Chùa Hương cũng là ngôi chùa mang đậm giá trị tâm linh thiêng liêng của người Việt. Đến thăm chùa Hương, du khách không chỉ được cầu tài phát lộc, thanh tịnh tâm hồn mà còn được chiêm ngưỡng bức tranh thiên nhiên đẹp như tiên cảnh và thưởng thức nhiều đặc sản độc đáo.Mặc dù nằm xa trung tâm nhưng chùa Hương vẫn thu hút hàng triệu du khách gần xa đến dâng hương lễ phật hàng năm và trở thành một trong những điểm Du lịch Hà Nội được nhiều người yêu thích nhất.', 'ctho.jpg');
INSERT INTO `chitiettour` VALUES (32, 32, '2023-05-03 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Yên Tử 1 ngày từ Hà Nội 2023. " Trăm năm tích đức tu hành - Chưa đi Yên Tử, chưa thành quả tu.” Dẫu không thành chính quả nhưng một lần hành hương về Yên Tử, du khách sẽ được nếm trải không ít khổ nạn trên con đường tìm đến một chút thanh tịnh, bình yên cho tâm hồn. Nằm chênh vênh trên độ cao 1.068m, Chùa Đồng – điểm đến cuối cùng trong quần thể di tích Trúc Lâm Yên Tử là sự thách thức lòng thành tâm của các thiện nam tín nữ và sự kiên nhẫn của các du khách vãn cảnh có mong muốn được thỉnh ba hồi chuông giữa chót vót mây vờn sương cuộn.', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (33, 33, '2023-04-30 02:04:00', '2023-04-30 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - City Tour Hà Nội 1 ngày giá tốt 2023. " Hà Nội – thủ đô ngàn năm văn hiến luôn cuốn hút du khách bởi nét cổ kính, yên bình lạ kỳ. Một chuyến tham quan quanh Hà Nội sẽ để lại trong lòng du khách những kỷ niệm khó quên về 36 khu phố nghề cổ kính của Hà Nội xưa, Văn miếu Quốc Tử Giám – biểu trưng của một thủ đô giàu truyền thống hiếu học, hồ Hoàn Kiếm và đền Ngọc Sơn – trái tim của Hà Nội, lăng chủ tịch Hồ Chí Minh – nơi an nghỉ ngàn thu của Bác Hồ kính yêu', 'halong.jpg');
INSERT INTO `chitiettour` VALUES (34, 34, '2023-05-01 02:04:00', '2023-05-01 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Tam Chúc - Tràng An 1 ngày từ Hà Nội 2023. Trong đời sống tâm linh của người Việt, chùa là một địa danh rất linh thiêng và tôn kính. Người ta đến chùa không chỉ để cầu may, tìm sự bình an, sự thanh thản, mà còn để tìm về với cội nguồn dân tộc. Đi chùa đã trở thành một việc làm không thể thiếu của rất nhiều người dân Việt Nam mỗi dịp Tết đến, xuân về. Tour du lịch chùa Tam Chúc 1 ngày đưa quý khách đến với ngôi chùa lớn nhất Đông Nam Á, đươc coi là “Hạ Long trên cạn” sau khi khánh thành sẽ chở thành khu du lịch trọng điểm cùa Hà Nam, Hãy cùng nhau  khám phá tour du lịch Chùa Tam Chúc 1 ngày nhé.', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (35, 35, '2023-08-05 02:04:00', '2023-08-07 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Hạ Long - Hà Nội 2N1Đ từ Hà Nội 2023. Trong đời sống tâm linh của người Việt, chùa là một địa danh rất linh thiêng và tôn kính. Người ta đến chùa không chỉ để cầu may, tìm sự bình an, sự thanh thản, mà còn để tìm về với cội nguồn dân tộc. Đi chùa đã trở thành một việc làm không thể thiếu của rất nhiều người dân Việt Nam mỗi dịp Tết đến, xuân về. Tour du lịch chùa Tam Chúc 1 ngày đưa quý khách đến với ngôi chùa lớn nhất Đông Nam Á, đươc coi là “Hạ Long trên cạn” sau khi khánh thành sẽ chở thành khu du lịch trọng điểm cùa Hà Nam, Hãy cùng nhau  khám phá tour du lịch Chùa Tam Chúc 1 ngày nhé.', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (36, 36, '2023-06-06 02:04:00', '2023-06-09 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Aquamarine Du Thuyền Ngủ Đêm 3N2Đ từ Hà Nội 2023. Du thuyền Hạ Long Aquamarine được thiết kế với vỏ thép và nội thất gỗ, 21 phòng ngủ hạng sang cực kỳ thoải mái và đẳng cấp. Các không gian nhà hàng, sundeck cực kỳ rộng rãi và thoải mái. Đội ngũ nhân viên được đào tạo chuyên nghiệp sẽ mang lại cho du khách một trải nghiệm tuyệt vời trên vịnh Hạ Long..', 'dnang.jpg');
INSERT INTO `chitiettour` VALUES (37, 37, '2023-09-09 02:04:00', '2023-09-11 02:04:00', 25, 'Du lịch Hà Nôi - Sapa - Bản Cát Cát - Check in Moana từ Hà Nội 2023. Du lịch Sapa - "Thành phố trong sương" nổi tiếng với với cảnh quan núi non hùng vĩ, khí hậu trong lành hoang sơ, quanh năm mát mẻ sẽ giúp bạn có được những giờ phút nghỉ dưỡng đúng nghĩa. Đến với tour Sapa bạn sẽ được trải nghiệm ngắm tuyết rơi vào mùa Đông, trèo lên đỉnh núi Fansipan - nơi được mệnh danh là nóc nhà Đông Dương, và được dạo quanh thung lũng Mường Hoa làm say lòng người. Thông qua tour du lịch Sapa du khách còn có dịp được trải nghiệm nhiều nét văn hóa độc đáo với cuộc sống của đồng bào dân tộc thiểu số vùng Miền núi phía Bắc, thưởng thức các món ăn truyền thống đặc sắc nơi đây', 'ckinhspa.jpg');
INSERT INTO `chitiettour` VALUES (38, 38, '2023-05-11 02:04:00', '2023-05-13 02:04:00', 25, 'Du lịch Hà Nôi - Sapa - Bản Cát Cát - Check in Moana từ Hà Nội 2023. Du lịch Sapa - "Thành phố trong sương" nổi tiếng với với cảnh quan núi non hùng vĩ, khí hậu trong lành hoang sơ, quanh năm mát mẻ sẽ giúp bạn có được những giờ phút nghỉ dưỡng đúng nghĩa. Đến với tour Sapa bạn sẽ được trải nghiệm ngắm tuyết rơi vào mùa Đông, trèo lên đỉnh núi Fansipan - nơi được mệnh danh là nóc nhà Đông Dương, và được dạo quanh thung lũng Mường Hoa làm say lòng người. Thông qua tour du lịch Sapa du khách còn có dịp được trải nghiệm nhiều nét văn hóa độc đáo với cuộc sống của đồng bào dân tộc thiểu số vùng Miền núi phía Bắc, thưởng thức các món ăn truyền thống đặc sắc nơi đâ', 'cm.jpg');
INSERT INTO `chitiettour` VALUES (39, 39, '2023-08-15 02:04:00', '2023-08-19 02:04:00', 25, 'Du lịch Miền Tây Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Châu Đốc từ Hà Nội 2023. Tạo hóa đã ban tặng cho miền Tây cái đẹp mộc mạc mà nên thơ, với những cánh đồng xanh bát ngát, những miệt vườn sai quả, những ngả đường trĩu nặng phù sa. Đặc biệt, du khách sẽ được xuôi về miền sang nước hữu tình này để chu du, thưởng ngoạn và trải nghiệm những điều bình dị, chân phương - Xuôi về Miền Tây, Du Khách có dịp trải nghiệm thú vị khi hòa mình vào cuộc sống miệt vườn, thưởng thức những món ăn đặc sản đậm đà hương vị của vùng đồng bằng cây ngọt trái lành. Đến Cần Thơ, vùng đất mệnh danh là “Tây Đô”, lên thuyền du ngoại chợ nổi Cái Răng, trực tiếp trải nghiệm nét văn hóa độc đáo trên sông nước. Ghé Sóc Trăng, thăm Chùa Dơi hơn 400 năm tuổi, vừa chiêm ngưỡng lối kiến trúc Khơmer độc đáo vừa nghe kể về đàn dơi huyền bí trụ ngụ trong khuôn viên chùa. Đặt chân đến Đất Mũi, vùng đất cuối cùng của Tổ quốc, đứng trên đài quan sát, Du Khách sẽ thu vào tầm mắt khung cảnh rừng mắm, rừng đước xanh rì nối nhau, trải dài ngút ngàn, tiếp giáp với mây trời. Đến Bạc Liêu, khám phá miền quê hương của chàng Công Tử tiêu tiền như nước, nghe nhắc lại những giai thoại nức tiếng gần xa trong quá khứ về sự xa hoa', 'ctho.jpg');
INSERT INTO `chitiettour` VALUES (40, 40, '2023-07-05 02:04:00', '2023-07-09 02:04:00', 25, 'Du lịch Tây Nguyên - Pleiku - Buôn Mê Thuột mùa Hoa Cafe từ Hà Nội 2023. Xuân về, mảnh đất Cao Nguyên như khoác lên mình một tấm áo choàng mới, với bạt ngàn màu trắng tinh khiết của loài cây đặc sản của vùng đất đỏ Bazan – Cafe. Khắp các thung lũng, sườn đồi, nương rẫy Cafe ngút ngàn tầm mắt, những bông hoa trắng, nhỏ tinh khiết nổi bật lên giữa màu đỏ của đất, màu xanh của lá...hút hồn tất cả du khách. Buôn Mê Thuột – Thành phố lớn bậc nhất Tây Nguyên, thủ phủ của hồ tiêu, Cafe. Pleiku nơi có Biển Hồ Tơ Nưng, vết tích còn sót lại của ngọn núi lửa hàng triệu năm tuổi, ngày nay thành 1 hồ nước trong xanh, soi bóng thông reo vi vút', 'ctho.jpg');
INSERT INTO `chitiettour` VALUES (41, 41, '2023-04-30 02:04:00', '2023-04-03 02:04:00', 25, 'Du lịch Hà Nội - Đảo Cát Bà - Vịnh Lan Hạ dịp Lễ 30/4 từ Hà Nội. Quần đảo Cát Bà là quần thể gồm 367 đảo trong đó có đảo Cát Bà ở phía Nam vịnh Hạ Long, ngoài khơi thành phố Hải Phòng và tỉnh Quảng Ninh, cách trung tâm thành phố Hải Phòng khoảng 30 km, cách thành phố Hạ Long khoảng 25 km. Về mặt hành chính, quần đảo thuộc huyện đảo Cát Hải, thành phố Hải Phòng. Nơi đây đã được UNESCO công nhận là khu dự trữ sinh quyển thế giới.', 's2.jpg');
INSERT INTO `chitiettour` VALUES (42, 42, '2023-06-20 02:04:00', '2023-06-22 02:04:00', 25, 'ombo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 Sao.', 'vrau.jpg');
INSERT INTO `chitiettour` VALUES (43, 43, '2023-08-22 02:04:00', '2023-08-26 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'dnang.jpg');
INSERT INTO `chitiettour` VALUES (44, 44, '2023-05-01 02:04:00', '2023-05-04 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'dnang.jpg');
INSERT INTO `chitiettour` VALUES (45, 45, '2023-07-25 02:04:00', '2023-07-30 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'dnang.jpg');
INSERT INTO `chitiettour` VALUES (46, 46, '2023-06-27 02:04:00', '2023-07-01 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'dnang.jpg');
INSERT INTO `chitiettour` VALUES (47, 47, '2023-05-02 02:04:00', '2023-05-04 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (48, 48, '2023-06-01 02:04:00', '2023-06-04 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (49, 49, '2023-08-02 02:04:00', '2023-08-03 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (50, 50, '2023-05-24 02:04:00', '2023-05-26 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');

-- ----------------------------
-- Table structure for chucvu
-- ----------------------------



-- ----------------------------
-- Table structure for chuongtrinhtour
-- ----------------------------
DROP TABLE IF EXISTS `chuongtrinhtour`;
CREATE TABLE `chuongtrinhtour`  (
  `id_chuongtrinh` int NOT NULL AUTO_INCREMENT,
  `id_tour` int NOT NULL,
  `tieude` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngaythu` int NOT NULL,
  `mota` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_chuongtrinh`) USING BTREE,
  INDEX `id_tour`(`id_tour`) USING BTREE,
  CONSTRAINT `chuongtrinhtour_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chuongtrinhtour
-- ----------------------------
INSERT INTO `chuongtrinhtour` VALUES (6, 30, '', 1, '06h30: Quý khách tập trung tại điểm đón.  07h00: Khởi hành đi Phan Thiết. Ăn sáng tại Long Thành. Trên đường đi quý khách tìm hiểu về lịch sử, văn hóa, địa lý của những vùng đất đi qua và tham gia các trò chơi vui nhộn cùng với HDV.  Trưa: Dùng cơm trưa tại nhà hàng địa phương. Trên đường về khách sạn, quý khách tham quan: Nghệ thuật tranh cát Phi Long Bảo tàng ngọc trai Long Beach Pearl Mũi Né. Nhận phòng khách sạn và nghỉ ngơi  Chiều: Đoàn tự do tắm biển tại resort. Dùng cơm chiều tại nhà hàng. Chương trình riêng của quý khách. Nghỉ đêm tại resor');
INSERT INTO `chuongtrinhtour` VALUES (7, 30, '', 2, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Quý khách chinh phục Đồi cát bay – tự do tham gia trò chơi trượt cát. Tiếp tục tham quan : Công viên tượng cát Forgotten land – mang chủ để cổ tích và truyền thuyết Việt Nam cùng thế giới, được điêu khắc từ 100% cát tự nhiên, không pha trộn phụ gia và chỉ nhờ sự nén chặt của cát và nước. (bao gồm trong tour).  Trưa: Đoàn dùng bữa trưa tại nhà hàng. Trở về khách sạn nghỉ ngơi.  Chiều: Xe đưa đoàn dùng cơm chiều tại nhà hàng. Quý khách đến với sân khấu Làng Chài – Fishermen Show, thưởng thức chương trình ca múa nhạc kịch trên nền sân khấu nhạc nước lập trình tái tạo cảnh biển cả và làng chài với hàng trăm ống phun nước kỹ thuật số công nghệ 2D và 3D mới nhất hiện nay, được đẩy áp lực cao bởi các bơm chìm công suất lớn và tạo màu bằng hàng ngàn đèn LED 256 màu. (chi phí tự túc).  Tối: Xe đưa đoàn trở về khách sạn nghỉ ngơi');
INSERT INTO `chuongtrinhtour` VALUES (8, 30, '', 3, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Đoàn sinh hoạt tự do  Trưa: Làm thủ tục trả phòng, đoàn dùng bữa trưa tại nhà hàng. Khởi hành về TP.HCM, trên đường về, quý khách tham quan và mua sắm: Cơ sở sản xuất nước mắm - mua sắm đặc sản của miền biển, cũng như tìm hiểu đời sống mua bán của người dân Bình Thuận. Tham quan Lâu Đài rượu vang : Quý khách được nghe giới thiệu về quy trình sản xuất, đóng chai và thưởng thức một trong những loại rượu vang hảo hạng nổi tiếng thế giới được xuất xứ từ Thung Lũng Napa (Mỹ)  Chiều: Về đến TP.HCM, xe đưa đoàn về điểm đón ban đầu, chia tay và hẹn gặp lại quý khách trong hành trình kế tiếp');
INSERT INTO `chuongtrinhtour` VALUES (9, 30, '', 4, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Đoàn sinh hoạt tự do  Trưa: Làm thủ tục trả phòng, đoàn dùng bữa trưa tại nhà hàng. Khởi hành về TP.HCM, trên đường về, quý khách tham quan và mua sắm: Cơ sở sản xuất nước mắm - mua sắm đặc sản của miền biển, cũng như tìm hiểu đời sống mua bán của người dân Bình Thuận. Tham quan Lâu Đài rượu vang : Quý khách được nghe giới thiệu về quy trình sản xuất, đóng chai và thưởng thức một trong những loại rượu vang hảo hạng nổi tiếng thế giới được xuất xứ từ Thung Lũng Napa (Mỹ)  Chiều: Về đến TP.HCM, xe đưa đoàn về điểm đón ban đầu, chia tay và hẹn gặp lại quý khách trong hành trình kế tiếp');
INSERT INTO `chuongtrinhtour` VALUES (10, 30, '', 5, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Đoàn sinh hoạt tự do  Trưa: Làm thủ tục trả phòng, đoàn dùng bữa trưa tại nhà hàng. Khởi hành về TP.HCM, trên đường về, quý khách tham quan và mua sắm: Cơ sở sản xuất nước mắm - mua sắm đặc sản của miền biển, cũng như tìm hiểu đời sống mua bán của người dân Bình Thuận. Tham quan Lâu Đài rượu vang : Quý khách được nghe giới thiệu về quy trình sản xuất, đóng chai và thưởng thức một trong những loại rượu vang hảo hạng nổi tiếng thế giới được xuất xứ từ Thung Lũng Napa (Mỹ)  Chiều: Về đến TP.HCM, xe đưa đoàn về điểm đón ban đầu, chia tay và hẹn gặp lại quý khách trong hành trình kế tiếp');
INSERT INTO `chuongtrinhtour` VALUES (11, 33, 'abc', 1, '<h6><a href=\"http://travel.com:8082/du-lich-bac-lieu-can-tho-ca-mau/49.html\">Du lịch Bạc Li&ecirc;u - Cần Thơ - C&agrave; Mau</a></h6>\r\n\r\n<h5>Khởi h&agrave;nh tại: Thanh kh&ecirc;</h5>\r\n\r\n<h5>Thời gian 3 ng&agrave;y / 3 đ&ecirc;m</h5>\r\n\r\n<h5>Gi&aacute;: 75489800</h5>\r\n\r\n<p>Lịch tr&igrave;nh: Du lịch Bạc Li&ecirc;u - Cần Thơ - C&agrave; Mau</p>\r\n\r\n<p>C&ograve;n: 24 chỗ</p>\r\n\r\n<p>-- dvshvjks</p>\r\n\r\n<p>ohgjk</p>\r\n\r\n<p>&nbsp;</p>');
INSERT INTO `chuongtrinhtour` VALUES (12, 33, '', 2, '05h00 Qúy khách tập trung tại điểm hẹn.  05h30 Khởi hành đi Cà Mau (350 km)  06h30 Thưởng thức món hủ tíu Mỹ Tho.  07h15 Tiếp tục hành trình đến Bạc Liêu.  11h45 Tham quan Nhà công tử Bạc Liêu.  12h30 Ăn trưa tại nhà hàng địa phương.  14h00 Tham quan Nhà Thờ Tắc Sậy (Nhà thờ Cha Diệp) tại huyện Giá Rai, cách Tp. Bạc Liêu 37 km.');
INSERT INTO `chuongtrinhtour` VALUES (13, 33, '', 3, '05h00 Qúy khách tập trung tại điểm hẹn.  05h30 Khởi hành đi Cà Mau (350 km)  06h30 Thưởng thức món hủ tíu Mỹ Tho.  07h15 Tiếp tục hành trình đến Bạc Liêu.  11h45 Tham quan Nhà công tử Bạc Liêu.  12h30 Ăn trưa tại nhà hàng địa phương.  14h00 Tham quan Nhà Thờ Tắc Sậy (Nhà thờ Cha Diệp) tại huyện Giá Rai, cách Tp. Bạc Liêu 37 km.');

-- ----------------------------
-- Table structure for diadiem
-- ----------------------------
DROP TABLE IF EXISTS `diadiem`;
CREATE TABLE `diadiem`  (
  `id_dd` int NOT NULL AUTO_INCREMENT,
  `id_tinh` int NOT NULL,
  `diemden` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mota` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_dd`) USING BTREE,
  INDEX `id_tinh`(`id_tinh`) USING BTREE,
  CONSTRAINT `diadiem_ibfk_1` FOREIGN KEY (`id_tinh`) REFERENCES `tinh` (`id_tinh`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diadiem
-- ----------------------------
INSERT INTO `diadiem` VALUES (3, 1, 'phố cổ hội an', 'Một địa danh nổi tiếng ở quảng nam');
INSERT INTO `diadiem` VALUES (4, 2, 'đảo lý sơn', 'Một trong những hàng đảo nổi tiếng nhất ở quảng ngãi');
INSERT INTO `diadiem` VALUES (5, 3, 'mỹ châu', 'xã');
INSERT INTO `diadiem` VALUES (6, 3, 'mỹ đức', 'xã');
INSERT INTO `diadiem` VALUES (7, 4, 'Hải châu', 'quận');
INSERT INTO `diadiem` VALUES (8, 4, 'Thanh khê', 'quận');
INSERT INTO `diadiem` VALUES (9, 4, 'Thanh khê', 'quận');
INSERT INTO `diadiem` VALUES (10, 5, 'U minh', 'rừng');

-- ----------------------------
-- Table structure for hoadon
-- ----------------------------
DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE `hoadon`  (
  `id_hd` int NOT NULL AUTO_INCREMENT,
  `id_pd` int NOT NULL,
  `ngaythanhtoan` DateTime NOT NULL,
  `tongtien` int NULL DEFAULT NULL,
  `tinhtrang` int NOT NULL,
  PRIMARY KEY (`id_hd`) USING BTREE,
  INDEX `id_pd`(`id_pd`) USING BTREE,
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`id_pd`) REFERENCES `phieudat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hoadon
-- ----------------------------
INSERT INTO `hoadon` VALUES (1, 1, '2018-06-02', 3784820, 0);
INSERT INTO `hoadon` VALUES (3, 3, '2018-06-02', 3784820, 0);
INSERT INTO `hoadon` VALUES (4, 2, '2018-06-02', 3784820, 0);

-- ----------------------------
-- Table structure for loaitour
-- ----------------------------
DROP TABLE IF EXISTS `loaitour`;
CREATE TABLE `loaitour`  (
  `id_lt` int NOT NULL AUTO_INCREMENT,
  `tenlt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_lt`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loaitour
-- ----------------------------
INSERT INTO `loaitour` VALUES (1, 'Sự kiện');
INSERT INTO `loaitour` VALUES (2, 'nổi bật');
INSERT INTO `loaitour` VALUES (3, 'yêu thích');
INSERT INTO `loaitour` VALUES (4, 'hàng đầu');
INSERT INTO `loaitour` VALUES (5, 'hàng đầu');
INSERT INTO `loaitour` VALUES (6, 'hàng đầu');

-- ----------------------------
-- Table structure for phieudat
-- ----------------------------
DROP TABLE IF EXISTS `phieudat`;
CREATE TABLE `phieudat`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
--   `cmnd` int NOT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sdt` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ghichu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_chitiet` int NOT NULL,
  `ngaydat` date NOT NULL,
  `treem` int NOT NULL,
  `trenho` int NOT NULL,
  `nguoilon` int NOT NULL,
  `soluongdat` int NOT NULL,
  `trangthai` int NOT NULL default 0,
  `huy` int NOT NULL default 0,
  `thanhtien` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_chitiet`(`id_chitiet`) USING BTREE,
  CONSTRAINT `phieudat_ibfk_1` FOREIGN KEY (`id_chitiet`) REFERENCES `chitiettour` (`id_chitiet`) ON DELETE cascade ON UPDATE cascade
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phieudat
-- ----------------------------



-- ----------------------------
-- Table structure for tinh
-- ----------------------------
DROP TABLE IF EXISTS `tinh`;
CREATE TABLE `tinh`  (
  `id_tinh` int NOT NULL AUTO_INCREMENT,
  `tentinh` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tinh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tinh
-- ----------------------------
INSERT INTO `tinh` VALUES (1, 'An Giang');
INSERT INTO `tinh` VALUES (2, 'Bạc Liêu');
INSERT INTO `tinh` VALUES (3, 'Bắc Giang');
INSERT INTO `tinh` VALUES (4, 'Bắc Kạn');
INSERT INTO `tinh` VALUES (5, 'Bắc Ninh');
INSERT INTO `tinh` VALUES (6, 'Bến Tre');
INSERT INTO `tinh` VALUES (8, 'Bình Dương');
INSERT INTO `tinh` VALUES (9, 'Bình Định');
INSERT INTO `tinh` VALUES (10, 'Bình Phước');
INSERT INTO `tinh` VALUES (11, 'Bình Thuận');
INSERT INTO `tinh` VALUES (12, 'Cà Mau');
INSERT INTO `tinh` VALUES (13, 'Cao Bằng');
INSERT INTO `tinh` VALUES (14, 'Cần Thơ');
INSERT INTO `tinh` VALUES (15, 'Đà Nẵng');
INSERT INTO `tinh` VALUES (16, 'Đắk Lắk');
INSERT INTO `tinh` VALUES (17, 'Điện Biên');
INSERT INTO `tinh` VALUES (18, 'Đồng Nai');
INSERT INTO `tinh` VALUES (19, 'Đồng Tháp');
INSERT INTO `tinh` VALUES (20, 'Gia Lai');
INSERT INTO `tinh` VALUES (22, 'Hà Giang');
INSERT INTO `tinh` VALUES (23, 'Hà Nam');
INSERT INTO `tinh` VALUES (24, 'Hà Nội');
INSERT INTO `tinh` VALUES (25, 'Hải Phòng');
INSERT INTO `tinh` VALUES (26, 'Hậu Giang');
INSERT INTO `tinh` VALUES (27, 'Hòa Bình');
INSERT INTO `tinh` VALUES (28, 'Thành phố Hồ Chí Minh');
INSERT INTO `tinh` VALUES (29, 'Hưng Yên');
INSERT INTO `tinh` VALUES (30, 'Khánh Hòa');
INSERT INTO `tinh` VALUES (31, 'Kiên Giang');
INSERT INTO `tinh` VALUES (32, 'Kon Tum');
INSERT INTO `tinh` VALUES (33, 'Lai Châu');
INSERT INTO `tinh` VALUES (34, 'Lạng Sơn');
INSERT INTO `tinh` VALUES (35, 'Lào Cai');
INSERT INTO `tinh` VALUES (36, 'Lâm Đồng');
INSERT INTO `tinh` VALUES (37, 'Long An');
INSERT INTO `tinh` VALUES (38, 'Nam Định');
INSERT INTO `tinh` VALUES (39, 'Nghệ An');
INSERT INTO `tinh` VALUES (40, 'Ninh Bình');
INSERT INTO `tinh` VALUES (41, 'Ninh Thuận');
INSERT INTO `tinh` VALUES (42, 'Phú Thọ');
INSERT INTO `tinh` VALUES (43, 'Phú Yên');
INSERT INTO `tinh` VALUES (44, 'Quảng Bình');
INSERT INTO `tinh` VALUES (45, 'Quảng Nam');
INSERT INTO `tinh` VALUES (46, 'Quảng Ngãi');
INSERT INTO `tinh` VALUES (47, 'Quảng Ninh');
INSERT INTO `tinh` VALUES (48, 'Quảng Trị');
INSERT INTO `tinh` VALUES (49, 'Sóc Trăng');
INSERT INTO `tinh` VALUES (50, 'Tây Ninh');
INSERT INTO `tinh` VALUES (51, 'Thái Bình');
INSERT INTO `tinh` VALUES (52, 'Thái Nguyên');
INSERT INTO `tinh` VALUES (53, 'Thanh Hóa');
INSERT INTO `tinh` VALUES (54, 'Thừa Thiên Huế');
INSERT INTO `tinh` VALUES (55, 'Tiền Giang');
INSERT INTO `tinh` VALUES (56, 'Tuyên Quang');
INSERT INTO `tinh` VALUES (57, 'Yên Bái');
INSERT INTO `tinh` VALUES (58, 'Vĩnh Long');
INSERT INTO `tinh` VALUES (59, 'Trà Vinh');

-- ----------------------------
-- Table structure for tour
-- ----------------------------
DROP TABLE IF EXISTS `tour`;
CREATE TABLE `tour`  (
  `id_tour` int NOT NULL AUTO_INCREMENT,
--   `id_tinh` int NULL DEFAULT NULL,
--   `id_dd` int NOT NULL,
  `noixuatphat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_lt` int NULL DEFAULT NULL,
  `phuongtien` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sltd` int NOT NULL,
  `tentour` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `songay` int NOT NULL,
  `sodem` int NOT NULL,
  `gianguoilon` float NOT NULL,
  `giatreem` float NOT NULL,
  `giatrenho` float NOT NULL,
  `motatour` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `lichtrinh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
--   `bando` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tour`) USING BTREE,
  INDEX `id_lt`(`id_lt`) USING BTREE,
--   INDEX `id_dd`(`id_dd`) USING BTREE,
--   INDEX `id_tinh`(`id_tinh`) USING BTREE,
--   CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`id_dd`) REFERENCES `diadiem` (`id_dd`) ON DELETE RESTRICT ON UPDATE RESTRICT
  CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`id_lt`) REFERENCES `loaitour` (`id_lt`) ON DELETE RESTRICT ON UPDATE RESTRICT
--   CONSTRAINT `tour_ibfk_3` FOREIGN KEY (`id_tinh`) REFERENCES `tinh` (`id_tinh`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tour
-- ----------------------------
INSERT INTO `tour` VALUES (1, 'Hà Nội', 4, 'xe khách, thuyền', 25, 'Du Lịch Miền Trung - Đà Nẵng - Động Thiên Đường 5 ngày dịp hè 2023', 5, 4, 7000000, 5000000, 1000000, 'dna.jpg', 'Đà Nẵng - Bà Nà - Hội An - Huế - Thánh Địa La Vang - Động Thiên Đường');
INSERT INTO `tour` VALUES (2, 'TP.Hồ Chí Minh', 6, 'xe bus', 25, 'Du Lịch Miền Bắc - Hạ Long - Sapa - Hàm Rồng 5 ngày giá tốt hè 2023', 5, 4, 8500000, 3000000, 1000000, 'spa.jpg', 'Hà Nội - Hạ Long - Lào Cai - Sapa - Fansipan');
INSERT INTO `tour` VALUES (3, 'Hà Nội', 6, 'xe bus', 25, 'Du lịch Nha Trang: Miền quê hương cát trắng', 3, 3, 8000000, 2500000, 1000000, 'nhatr.jpg', 'nha trang');
INSERT INTO `tour` VALUES (4, 'Hà Nội', 6, 'ô tô , thuyền', 25, 'Du lịch Cà Mau - U Minh Hạ mùa gác kèo ong - Homestay Đất Mũi Cà Mau', 3, 3, 7548980, 2500000, 1300000, 'cm.jpg', 'Du lịch Cà Mau - U Minh Hạ mùa gác kèo ong - Homestay');
INSERT INTO `tour` VALUES (5, 'Bắc Ninh', 4, 'xe ôm', 25, 'Du lịch Tiền Giang - Cần Thơ', 4, 3, 8000000, 2000000, 1300000, 'ctho.jpg', 'Du lịch Tiền Giang - Cần Thơ');
INSERT INTO `tour` VALUES (6, 'Hải phòng', 6, 'xe ôm', 25, 'Du lịch Cần Thơ', 4, 3, 8000000, 2000000, 1300000, 'cantho.jpg', 'Du lịch Tiền Giang - Cần Thơ');
INSERT INTO `tour` VALUES (7, 'Hà Nội', 6, 'xe bus', 25, 'Du lịch Bạc Liêu - Cần Thơ - Cà Mau', 3, 3, 7300000, 1500000, 1000000, 'balieu.jpg', 'Du lịch Bạc Liêu - Cần Thơ - Cà Mau');
INSERT INTO `tour` VALUES (8, 'TP.Hồ Chí Minh', 6, 'xe bus', 25, 'Vườn rau thủy canh - Thác Datanla - Thiền viện Trúc Lâm', 3, 3, 7548980, 784820, 500000, 'vrau.jpg', 'Vườn rau thủy canh - Thác Datanla - Thiền viện Trúc Lâm');
INSERT INTO `tour` VALUES (9, 'TP.Hồ Chí Minh', 5, 'xe bus', 25, 'Du lịch Đà Nẵng - Bà Nà - Hội An - Huế - Động Phong Nha', 3, 3, 7548980, 1784820, 1123546, 'dnang.jpg', 'Du lịch Đà Nẵng - Bà Nà - Hội An - Huế - Động Phong Nha');
INSERT INTO `tour` VALUES (10,'TP.Hồ Chí Minh', 5, 'xe bus', 25, 'Du lịch Hà Nội - Thị trấn Sapa mờ sương', 3, 3, 5500000, 1000000, 500000, 'sapa.jpg', 'Du lịch Hà Nội - Thị trấn Sapa mờ sương');
INSERT INTO `tour` VALUES (11,'Hà Nội', 3, 'xe bus', 25, 'Du lịch Phan Thiết: Mũi Né - Công viên tượng cát - Show nhạc nước Huyền Thoại Làng Chài', 3, 3, 7500000, 1700000, 1100000, 'pthiet.jpg', 'Du lịch Phan Thiết: Mũi Né - Công viên tượng cát - Show nhạc nước Huyền Thoại Làng Chài');
INSERT INTO `tour` VALUES (12, 'Hà Nội', 3, 'xe bus', 25, 'Tour Lễ Hội Pháo Hoa Đà Nẵng - Huế 3 ngày khởi hành hè 2023 giá tốt', 3, 3, 7500000, 1700000, 1000000, 'phao1.jpg', 'Đà Nẵng - Bà Nà - Ngũ Hành Sơn - Bán Đảo Sơn Trà - Hội An - Huế');
INSERT INTO `tour` VALUES (13, 'TP.Hồ Chí Minh', 3, 'xe bus', 25, 'Du Lịch Đông Bắc - Hà Giang - Cao Bằng - Hồ Ba Bể 3 ngày hè 2023', 3, 3, 6000000, 1700000, 1200000, 'cbang.jpg', 'Hà Nội - Hà Giang - Quản Bạ - Đồng Văn - Lũng Cú - Mèo Vạc - Cao Bằng - Thác Bản Giốc - Động Ngườm Ngao - Hang Pắc Pó - Hồ Ba Bể');
INSERT INTO `tour` VALUES (14, 'TP.Hồ Chí Minh', 5, 'xe bus', 25, 'Combo Sapa 2 ngày khởi hành từ Hà Nội - Khách sạn 4 sao Sapa Charm Hotel', 2, 2, 6500000, 1200000, 900000, 'ckinhspa.jpg', 'Thị trấn Sapa - Bản Cát Cát - Núi Hàm Rồng - Fansipan');
INSERT INTO `tour` VALUES (15, 'Hà Nội', 4, 'xe ôm', 25, 'Du Lịch Hạ Long - Hải Phòng - Ninh Bình 4 ngày giá tiết kiệm hè 2023', 4, 3, 5300000, 700000, 500000, 'halong.jpg', 'Hà Nội - Yên Tử - Hạ Long - Hải Phòng - Cầu Vượt Biển Tân Vũ - Ninh Bình - Chùa Bái Đính - Tràng An');
INSERT INTO `tour` VALUES (16, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du Lịch Miền Tây - Mỹ Tho - Chùa Vình Tràng - Cần Thơ 2 ngày lễ 2/9', 2, 2, 7100000, 1000000, 600000, 'mytho.jpg', 'Mỹ Tho - Chùa Vĩnh Tràng - Cồn Long - Lân - Qui - Phụng - Cần Thơ - Chợ Nổi Cái Răng');
INSERT INTO `tour` VALUES (17, 'Hà Nội', 4, 'xe bus', 25, 'Tour Hành Hương Tháng Giêng Bạc Liêu - Mẹ Nam Hải giá tiết kiệm 2023', 2, 2, 6500000, 1500000, 1000000, 'hhuong.jpg', 'Bạc Liêu - Quan Âm Phật Đài Mẹ Nam Hải - Cánh Đồng Quạt Gió - Chùa Xiêm Cán');
INSERT INTO `tour` VALUES (18,'Hà Nội', 4, 'xe bus', 25, 'Du Lịch Phú Quốc - Hòn Móng Tay - Hòn Mây Rút giá tiết kiệm 2023', 4, 3, 5500000, 1500000, 7000000, 'honmt.jpg', 'Phú Quốc - Hòn Móng Tay - Hòn Mây Rút');
INSERT INTO `tour` VALUES (19, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch Mai Châu - Mộc Châu - Ninh Bình 4 ngày khởi hành dịp hè 2023', 4, 3, 7500000, 3784820, 1000000, 'mchau.jpg', 'Mai Châu - Bản Lác - Mộc Châu - Thác Dải Yếm - Đồi Chè Trái Tim - Chùa Bái Đính - Tràng An');
INSERT INTO `tour` VALUES (20, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Lễ 30/4 - Tour Du lịch Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sapa từ Sài Gòn 2023', 4, 3, 5548980, 1184820, 500000, 'halong1.jpg', 'Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sapa');
INSERT INTO `tour` VALUES (21,'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hà Nội - Quảng Bình - Động Phong Nha - Bãi Đá Nhảy - Hang Tám Cô dịp Hè từ Hà Nội 2023', 4, 3, 7500000, 1184820, 1000000, 'qbinh.jpg', 'Hà Nội - Quảng Bình - Động Phong Nha - Bãi Đá Nhảy - Hang Tám');
INSERT INTO `tour` VALUES (22, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Hè - Tour Du lịch Quy Nhơn - Phú Yên từ Hà Nội 2023', 4, 3, 7500000, 1184820, 1000000, 'qnhon.jpg', 'Quy Nhơn - Phú Yên');
INSERT INTO `tour` VALUES (23, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang từ Hà Nội 2023', 5, 5, 7500000, 1184820, 1000000, 'hnoi1.jpg', 'Hà Nội - Nha Trang');
INSERT INTO `tour` VALUES (24, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang bay Bamboo Airways từ Hà Nội 2023', 4, 3, 7500000, 2500000, 1000000, 'nhatrang.jpg', 'Hà Nội - Nha Trang');
INSERT INTO `tour` VALUES (25, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè Tour Hà Nội - Quy Nhơn - Tuy Hòa - Quy Nhơn từ Hà Nội 2023', 4, 3, 7500000, 2000000, 1000000, 'tuyhoa.jpg', 'Hà Nội - Quy Nhơn - Tuy Hòa - Quy Nhơn');
INSERT INTO `tour` VALUES (26, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè Tour Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Đất Mũi - Châu Đốc từ Hà Nội 2023', 4, 3, 7500000, 1500000, 1000000, 'camau.jpg', 'Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Đất Mũi - Châu Đốc');
INSERT INTO `tour` VALUES (27, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè Tour Du lịch Phú Quốc Khám phá Đảo Ngọc từ Hà Nội 2023', 4, 3, 7500000, 2500000, 1000000, 'dngoc.jpg', 'Phú Quốc Khám phá Đảo Ngọc');
INSERT INTO `tour` VALUES (28, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè - Tour Hà Nội - Sài Gòn - Mũi Né - Vũng Tàu từ Hà Nội 2023', 4, 3, 7500000, 2200000, 900000, 'cham.jpg', 'Hà Nội - Sài Gòn - Mũi Né - Vũng Tàu');
INSERT INTO `tour` VALUES (29, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Hoa Lư - Tam Cốc 1 ngày từ Hà Nội 2023', 1, 0, 3500000, 800000, 500000, 'hoalu.jpg', 'Hà Nội - Hoa Lư - Tam Cốc');
INSERT INTO `tour` VALUES (30, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Bái Đính - Tràng An 1 ngày từ Hà Nội 2023', 1, 0, 3000000, 1000000, 500000, 'baidinh.jpg', 'Hà Nội - Bái Đính - Tràng An');
INSERT INTO `tour` VALUES (31, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Hương 1 ngày từ Hà Nội 2023', 1, 0, 2500000, 600000, 300000, 'chuahuong.jpg', 'Hà Nội - Chùa Hương');
INSERT INTO `tour` VALUES (32, 'Đà Nẵng', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Yên Tử 1 ngày từ Hà Nội 2023', 1, 0, 3500000, 800000, 400000, 'yentu.jpg', 'Hà Nội - Yên Tử');
INSERT INTO `tour` VALUES (33, 'Đà Nẵng', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - City Tour Hà Nội 1 ngày giá tốt 2023', 1, 0, 3500000, 800000, 400000, 'hnoi.jpg', ' Hà Nội - City Tour');
INSERT INTO `tour` VALUES (34, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Tam Chúc - Tràng An 1 ngày từ Hà Nội 2023', 1, 0, 2500000, 500000, 300000, 'tamchuc.jpg', 'Hà Nội - Chùa Tam Chúc - Tràng An');
INSERT INTO `tour` VALUES (35, 'Đà Nẵng', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Hạ Long - Hà Nội 2N1Đ từ Hà Nội 2023', 2, 1, 2500000, 500000, 300000, 'qninh.jpg', ' Hà Nội - Hạ Long');
INSERT INTO `tour` VALUES (36,'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Aquamarine Du Thuyền Ngủ Đêm 3 ngày từ Hà Nội 2023', 3, 2, 2500000, 500000, 200000, 'duthu.jpg', 'Hà Nội - Aquamarine Du Thuyền');
INSERT INTO `tour` VALUES (37, 'Quảng Bình', 4, 'xe bus', 25, 'Du lịch Hà Nôi - Sapa - Bản Cát Cát - Check in Moana từ Hà Nội 2023', 3, 2, 4500000, 1000000, 500000, 'mona.jpg', 'Hà Nôi - Sapa - Bản Cát Cát - Check in Moana');
INSERT INTO `tour` VALUES (38, 'Nghệ An', 4, 'xe bus', 25, 'Du lịch Hà Nôi - Sapa - Fansipan - Check in Moana - Bản Cát Cát từ Hà Nội 2023', 2, 1, 7500000, 3784820, 23546, 'fan.jpg', 'Hà Nôi - Sapa - Fansipan - Check in Moana - Bản Cát Cát');
INSERT INTO `tour` VALUES (39, 'Thanh Hóa', 4, 'xe bus', 25, 'Du lịch Miền Tây Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Châu Đốc từ Hà Nội 2023', 4, 3, 7500000, 1500000, 1000000, 'mtay.jpg', 'Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Châu Đốc');
INSERT INTO `tour` VALUES (40, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Tây Nguyên - Pleiku - Buôn Mê Thuột mùa Hoa Cafe từ Hà Nội 2023', 4, 3, 6500000, 1000000, 800000, 'tayn.jpg', 'Tây Nguyên - Pleiku - Buôn Mê Thuột');
INSERT INTO `tour` VALUES (41, 'Bắc Giang', 4, 'xe bus', 25, 'Du lịch Hà Nội - Đảo Cát Bà - Vịnh Lan Hạ dịp Lễ 30/4 từ Hà Nội', 3, 3, 5500000, 1500000, 900000, 'catba.jpg', 'Hà Nội - Đảo Cát Bà - Vịnh Lan Hạ');
INSERT INTO `tour` VALUES (42, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Nha Trang 3N2Đ khách sạn 4 sao từ Hà Nội giá tốt 2023', 3, 2, 7500000, 1500000, 900000, 'nha1.jpg', 'Nha Trang');
INSERT INTO `tour` VALUES (43, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Nha Trang 4N3Đ khách sạn 4 sao từ Hà Nội giá tốt 2023', 4, 3, 7500000, 1500000, 900000, 'nha2.jpg', 'Nha Trang');
INSERT INTO `tour` VALUES (44, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Nha Trang 3N2Đ khách sạn 5 sao Siêu Khuyến Mãi từ Hà Nội', 3, 2, 7500000, 1500000, 600000, 'nha3.jpg', 'Nha Trang');
INSERT INTO `tour` VALUES (45, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Vũng Tàu 4N3Đ khách sạn 5 sao Siêu Khuyến Mãi từ Hà Nội', 4, 3, 7500000, 1500000, 900000, 'vungtau.jpg', 'Vũng Tàu');
INSERT INTO `tour` VALUES (46, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Đà Lạt 4N3Đ khách sạn 3 sao từ Hà Nội giá tốt 2023', 4, 3, 7500000, 1500000, 700000, 'dalat.jpg', 'Đà Lạt');
INSERT INTO `tour` VALUES (47, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Phú Thọ - Đền Hùng giá tốt khởi hành từ Hà Nội 2023', 2, 1, 3500000, 1800000, 900000, 'denhung.jpg', 'Phú Thọ - Đền Hùng');
INSERT INTO `tour` VALUES (48, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hồ Ba Bể - Thác Bản Giốc 3 ngày giá tốt từ Hà Nội', 3, 2, 7500000, 1500000, 900000, 'ban.jpg', 'Hồ Ba Bể - Thác Bản Giốc');
INSERT INTO `tour` VALUES (49, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Thanh Hóa - Đền Sòng Sơn - Đền Cô Chín - Suối Cá Thần từ Hà Nội 2023', 1, 1, 3500000, 840820, 235460, 'suoi.jpg', 'Thanh Hóa - Đền Sòng Sơn - Đền Cô Chín - Suối Cá Thần');
INSERT INTO `tour` VALUES (50, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 2548980, 500000, 200000, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (51, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (52, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (53, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (54, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (55, 'Hà Nội', 4, 'xe bus', 25, 'duc anh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cmnd` int NOT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sdt` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ghichu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_cv` int NOT NULL,
  `Status`			INT  DEFAULT 0 , -- 0:Not Active, 1: Active
  `avatarUrl` varchar(600),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cv`(`id_cv`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_cv`) REFERENCES `chucvu` (`id_cv`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `user` VALUES (2	, 'Nguyễn thị ngân'			, 2059437335	, ' Quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note1'	, 'ngannguyen'	, '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	, 1		,1 		,'' );
INSERT INTO `user` VALUES (9	, 'Lê nguyễn thanh tuyền'	, 205943664		, ' Quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note2'	, 'tthuyen'		, '$2y$10$4OPYhSdN/E8kYI8R9/XOLe2oGMLmJMZqfWRntc4L.BOMF0ktSG9My'	, 4		,1 		,'' );
INSERT INTO `user` VALUES (10	, 'Nguyễn Thị Ngân'			, 205943664		, ' Quảng nam'		, 1226452598, 'levantinh@gmail.com'				, 'note3'	, 'tuyen2'		, '$2y$10$67hudI0nqJpTQ9Ye90ZCX.lbkPuue3vX9Qtf5tZO0QNXeuXdHiP36'	, 1		,1 		,'' );
INSERT INTO `user` VALUES (12	, 'lê văn tịnh'				, 205943664		, ' quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note4'	, 'tinhle'		, '$2y$10$ucxVKawI1N3hinTnPIwx5eddDcw.uH8lIL4o2VZ1m4C4pZNRYz3q6'	, 5		,1 		,'' );
INSERT INTO `user` VALUES (14	, 'czx'						, 2059437335	, 'quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note5'	, 'tuyenlnt'	, '$2y$10$H3dpN1wBS0XfA8S1IYYprOhE8cAOpGPT04eMqW0XOnet0Qg6pEpHC'	, 4		,1 		,'' );
INSERT INTO `user` VALUES (15	, 'a'						, 2059437335	, 'đ'				, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note6'	, 'a'			, '$2y$10$XIsjlIEUXNkovdPq0Zf9Wu6nOADYku8WT3DBl66p3Ba6UMd.mbiDm'	, 1		,1		,'' );
INSERT INTO `user` VALUES (16	, 'admin'					, 123456789		, 'VP'				, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note7'	, 'adminn'		, '$2a$12$M4f5oWU.pwjw/IYLUpNilu7JMRl4AV7SEcUUCsDaX//ZNBE6vA4NO'	, 4		,1		,'' );

SET FOREIGN_KEY_CHECKS = 1;

-- Create table Registration_User_Token
DROP TABLE IF EXISTS 	`Token`;
CREATE TABLE IF NOT EXISTS `Token` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`token`	 		CHAR(36) NOT NULL UNIQUE,
	UserID     		INT NOT NULL,
	`expiryDate` 	DATETIME NOT NULL,
    `type`			Varchar(50),
    FOREIGN KEY (UserID) REFERENCES  `user`(`id`)
);

DROP TABLE IF EXISTS 	`TinTuc`;
CREATE TABLE IF NOT EXISTS `TinTuc` ( 	
	id_tin 				INT AUTO_INCREMENT PRIMARY KEY,
	`ten`	 		varchar(200) NOT NULL ,
	noidung     		mediumtext NOT NULL,
	`anh1` 	varchar(200) NOT NULL,
    `anh2`			Varchar(200)
);

DROP TABLE IF EXISTS 	`KhachSan`;
CREATE TABLE IF NOT EXISTS `KhachSan` ( 	
	id_ks 				INT AUTO_INCREMENT PRIMARY KEY,
	`ten_ks`	 		varchar(200) NOT NULL ,
	noidung     		mediumtext NOT NULL,
	`hinhAnh` 	varchar(200) NOT NULL,
    `sdt1`			int not null,
    sdt2			int not null,
    gia				float not null,
    dia_chi   varchar(200) NOT NULL,
    `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
--     `ngaydat` TIMESTAMP DEFAULT NOW()
);

INSERT INTO `KhachSan` VALUES (1, 'VINPEARL RESORT & GOLF PHU QUOC','Vinpearl Phú Quốc Resort & Golf đẹp mê hoặc và sang trọng với thiết kế mang phong cách kiến trúc châu Âu tân cổ điển, nằm kế sân gôn 18 hố độc đáo trong khu rừng nguyên sinh tự nhiên. Đây là lựa chọn tuyệt vời cho không gian nghỉ dưỡng yên bình hay những bữa tiệc ngoài trời bên hồ bơi lớn và bãi biển với quy mô lên tới hơn 3.000 người.' , 'phu.jpg', 0902976588, 0932659588 , 2850000, 'Gành Dầu- Phú Quốc- Kiên Giang','khachsan@thanhtungtour.com.vn');
INSERT INTO `KhachSan` VALUES (2, 'VINPEARL RESORT & GOLF NAM HỘI AN','Ôm trọn 1.300m bờ biển Bình Minh nguyên sơ, Vinpearl Resort & Golf Nam Hội An là quần thể du lịch nghỉ dưỡng và khám phá duy nhất tại Việt Nam kết hợp nghỉ dưỡng biển và công nghệ giải trí thời thượng để đem đến những trải nghiệm nghỉ dưỡng trọn vẹn nhất cho mỗi du khách.' , 'hoian.jpg', 0902976588, 0932659588 , 4150000, 'Bình Minh- Thăng Bình- Quảng Nam','khachsan@thanhtungtour.com.vn');
INSERT INTO `KhachSan` VALUES (3, 'VINPEARL CONDOTEL RIVERFRONT DA NANG','Vinpearl Condotel Riverfront Đà Nẵng được xây dựng trên diện tích 6500m2, với độ cao 41 tầng cung cấp ra thị trường 1300 – 1500 căn hộ khách sạn cao cấp. Vinpearl Condotel Riverfront Đà Nẵng xây dựng trên vị trí đắc địa trên đường Trần Phú đẹp nhất thành phố biển Nha Trang, với tầm nhìn độc đáo hướng trực diện sông Hàn và cầu Rồng, mở thoáng bao quát toàn thành phố và hướng biển' , 'd3.jpg', 0902976588, 0932659588 , 2450000, 'Trần Hưng Đạo- An Hải Bắc- Sơn Trà- Đà Nẵng','khachsan@thanhtungtour.com.vn');
INSERT INTO `KhachSan` VALUES (4, 'Vinpearl Resort & Spa Đà Nẵng','Yên bình nằm bên bãi biển Non Nước xinh đẹp, Vinpearl Resort & Spa Đà Nẵng sở hữu 122 căn biệt thự với tầm nhìn độc đáo vừa hướng hồ, vừa hướng biển. Kiến trúc tân cổ điển đặc trưng và phong cảnh thiên nhiên hữu tình khiến cho khu nghỉ dưỡng từ lâu đã trở thành điểm đến không thể bỏ qua dành cho cả gia đình trong hành trình khám phá thành phố Đà Nẵng xinh đẹp cũng dễ dàng ghé thăm khu phố cổ Hội An yên bình..' , 'd11.jpg', 0902976588, 0932659588 , 8850000, 'Gành Dầu- Phú Quốc- Kiên Giang','khachsan@thanhtungtour.com.vn');
INSERT INTO `KhachSan` VALUES (5, 'Đặt phòng khách sạn Grand Hồ Tràm 5 sao','Nằm đối diện resort là sân gôn The Bluffs do tay gôn huyền thoại Greg Norman thiết kế. The Grand Ho Tram Strip cách Thành phố Hồ Chí Minh 2 giờ lái xe qua huyện Long Thành và sắp xếp buýt miễn phí cho khách. Dịch vụ đón tại sân bay và máy bay trực thăng được cung cấp kèm phụ phí. 
Resort cách thành phố Vũng Tàu 50 km và cách Sân bay Quốc tế Tân Sơn Nhất khoảng 120 km. .' , 'htra.jpg', 0902976588, 0932659588 , 1850000, 'Đường Ven Biển- Phước Thuận- Xuyên Mộc- Bà Rịa - Vũng Tàu','khachsan@thanhtungtour.com.vn');
INSERT INTO `KhachSan` VALUES (6, 'Đặt phòng khách sạn Angsana Lăng Cô giá tốt','Angsana Lang Co là resort hiện đại với nội thất đầy phong cách Châu Âu. Các phòng được trang bị máy lành và Wi-Fi miễn phí. Resort được trang bị 2 nhà hàng, quầy bar, spa cũng như hồ bơi ngoài trời.' , 'lc.jpg', 0902976588, 0932659588 , 3850000, ' Cu Du Village- Phú Lộc- Đà Nẵng','khachsan@thanhtungtour.com.vn');
INSERT INTO `KhachSan` VALUES (7, 'Đặt phòng khách sạn Furama Đà Nẵng','Furama Đà Nẵng là một khu nghỉ dưỡng 5 sao sang trọng, có uy tín và được xem là một trong những biểu tượng của ngành du lịch Việt Nam.' , 'fu.jpg', 0902976588, 0932659588 , 3999000, 'Khuê Mỹ- Ngũ Hành Sơn- Đà Nẵng','khachsan@thanhtungtour.com.vn');
INSERT INTO `KhachSan` VALUES (8, 'VINPEARL DISCOVERY 1 PHU QUOC','Mỗi biệt thự tại Vinpearl Discovery 1 Phú Quốc đều có khoảng sân vườn rộng với thiên nhiên khoáng đạt bên ngoài ô cửa. Khu nghỉ dưỡng sở hữu bãi biển riêng và địa hình tiếp giáp sân golf trong rừng nguyên sinh độc đáo mang đến nhiều trải nghiệm nghỉ dưỡng cho mỗi du khách yêu thích thể thao và khám phá thiên nhiên.' , 'vi.jpg', 0902976588, 0932659588 , 2850000, 'Gành Dầu- Phú Quốc- Kiên Giang','khachsan@thanhtungtour.com.vn');

DROP TABLE IF EXISTS 	`KhachDat`;
CREATE TABLE IF NOT EXISTS `KhachDat` ( 	
	id_khach 				INT AUTO_INCREMENT PRIMARY KEY,
	`hoTen`	 		varchar(200) NOT NULL ,
	yeucau     		mediumtext NOT NULL,
    `sdt`			int not null,
    dia_chi   varchar(200) NOT NULL,
    `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
    `ngaydat` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`id_ks` int NOT NULL,
	 INDEX `id_ks`(`id_ks`) USING BTREE,
	 CONSTRAINT `khachdat_ibfk_1` FOREIGN KEY (`id_ks`) REFERENCES `KhachSan` (`id_ks`) ON DELETE cascade ON UPDATE cascade
);


INSERT INTO `TinTuc` VALUES (1, 'Trọn bộ kinh nghiệm du lịch Côn Đảo 2023 tự túc siêu tiết kiệm', 
'Nổi bật với cảnh quan tươi đẹp, bãi biển hoang sơ tự nhiên, Côn Đảo từ lâu vẫn luôn là một địa điểm du lịch hấp dẫn nhiều người. Không quá yên bình, ồn ào, náo nhiệt như những nơi khác, Côn Đảo vẫn lựa chọn giữ cho mình nét trầm mặc vốn có. Với những kinh nghiệm du lịch Côn Đảo chi tiết mà Du Lịch Việt đã kể ra trong bài viết dưới đây, hy vọng sẽ giúp cho chuyến đi của bạn có thật nhiều trải nghiệm thú vị đáng nhớ.;

Du lịch Côn Đảo 2023 nên đi mùa nào đẹp nhất?;
Côn Đảo từ lâu đã là một địa điểm du lịch lý tưởng mà bạn nhất định không nên bỏ lỡ bởi sở hữu một vẻ đẹp ấn tượng đáng nhớ. Tuy nhiên, để có được một chuyến du lich Con Dao trọn vẹn, bạn cần nắm bắt thông tin về thời tiết, lựa chọn thời gian thích hợp đến Côn Đảo. Vậy ở Côn Đảo, mùa nào đẹp nhất?

Theo kinh nghiệm từ Công ty du lịch, khoảng thời gian tháng 3 đến tháng 9 rất lý tưởng để bạn đặt chân đến Côn Đảo khám phá. Vào thời điểm mùa mưa vẫn sẽ có nắng và những cơn mưa thường xuất hiện ngắn nên việc đi lại tham quan rất thuận tiện. Còn đối với khoảng thời gian từ tháng 10 đến tháng 2 hàng năm, do chịu ảnh hưởng từ gió Đông Bắc nên gió biển lúc này cũng mạnh hơn và không quá lý tưởng để bạn đi du lịch Côn Đảo. Tuy nhiên, nếu đến Côn Đảo vào thời điểm này, bạn vẫn có thể tham quan những địa điểm như hòn Tre, bãi Đầm Trầu, bãi Suối Nóng,...;

Mách bạn những món ngon không thể bỏ qua khi đi tour Côn Đảo;
Đi tour du lịch Côn Đảo, không chỉ được chiêm ngưỡng không gian yên bình đẹp mê hồn của vùng biển nơi đây mà du khách còn có thể thưởng thức nhiều món ăn đặc sản vô cùng độc đáo mà chỉ ở Côn Đảo mới có được, ví dụ như:

Ốc vú nàng: Đây là một loại ốc quý hiếm nổi tiếng của vùng đất Côn Đảo. Ốc vú nàng thường sẽ có kích thước bằng 3 ngón tay cho đến nửa bàn tay của người lớn. Ngoài cách luộc thông thường thì loại ốc vú nàng này cũng có thể chế biến theo nhiều cách khác nhau như nướng, làm gỏi, xào,... đều thơm ngon khó cưỡng.

Mứt hạt bàng: Mứt hạt bàng là một món ngon nổi tiếng Côn Đảo với độ giòn, bùi, có vị thơm đặc trưng, thường sẽ được rang với muối hoặc đường. Mứt hạt bàng là một món ăn đặc sản thường được du khách đi tour Côn Đảo chọn mua về làm quà dành tặng cho bạn bè hoặc người thân.

Mắm nhum: Mắm nhum đặc sản Côn Đảo rất nổi tiếng với hương vị đặc biệt được hòa quyện từ vị ngọt của nhum, vị mặn của biển. Sự kết hợp hoàn hảo của hương vị này chắc chắn sẽ khiến bất cứ ai khi thưởng thức cũng đều mê mẩn.

Trọn bộ kinh nghiệm du lịch Côn Đảo 2023 tự túc siêu tiết kiệm;


Gợi ý những điểm tham quan thú vị khi du lịch Côn Đảo 2023;
Đi tour du lich Con Dao, một số địa điểm tham quan nổi tiếng và đặc sắc mà bạn có thể lựa chọn ghé đến đó là:

Nhà Tù Côn Đảo: Nhà tù này đã trải qua suốt 113 năm tồn tại và mỗi khi đến đây, du khách sẽ được nghe kể lại về lịch sử của nó. Ngoài ra, bạn sẽ được đi tham quan những nơi đã từng giam giữ biết bao người lính của Việt Nam qua khung cảnh được tái hiện lại rất chân thật.

Hòn Bảy Cạnh: Đây là hòn đảo lớn thứ hai ở Côn Đảo được bao phủ bởi hệ thống rừng nguyên sinh rộng lớn. Tại hòn Bảy Cạnh, du khách có thể trải nghiệm ngồi lênh đênh trên thuyền ngắm hoàng hôn ngay giữa biển vô cùng lãng mạn và thú vị.

Bãi Đầm Trầu: Địa điểm này chắc hẳn đã không còn quá xa lạ đối với những khách du lịch Côn Đảo. Bãi Đầm Trầu thu hút bởi những ngọn núi trải theo hình vòng cung, là nơi mà bạn có thể thỏa sức sống ảo với những chiếc máy bay ngang qua bãi Đầm Trầu trông cực chill.

Hy vọng rằng những kinh nghiệm du lịch trong bài viết trên đây sẽ giúp cho hành trình đi tour Con Dao của bạn được thuận lợi hơn bao giờ hết. Lưu lại ngay những gợi ý này và lên kế hoạch vi vu Côn Đảo ngay từ bây giờ nhé!

.', 'condao.jpg', 'condao.jpg');
INSERT INTO `TinTuc` VALUES (2, 'Top 6 cảnh đẹp nổi tiếng không thể bỏ qua khi du lịch Nam Du hè 2023', 
'Đừng bỏ qua danh sách những tọa độ du lich Nam Du cực chất dưới đây nhé, chắc chắn sẽ giúp cho chuyến đi của bạn thật thú vị đấy!;

Bãi Ngự;
Theo ghi chép lại từ lịch sử thì Nguyễn Ánh lúc trên đường đi sáng Xiêm để xin chi viện đã từng dừng chân tại nơi đây vừa nghỉ ngơi vừa để thư giãn và ngắm cảnh. Cũng chính vì thế mà nơi đây có tên là bãi Ngự. Tại bãi Ngự vào năm 2017, người dân đã từng thấy có xác cá voi lưng xám họ nhà Táng trôi dạt đến đây, và theo tập tục thờ cúng nơi này đã lập một ngôi miếu thờ bộ xương cá voi (tức cá ông). Ngôi miếu này được đặt tên là Miếu Nam Hải Ngư Thần và ngày nay bạn có thể tìm đến tham quan tại bãi Ngự Nam Du.;


Hải đăng Nam Du;
Để có thể đến được hòn Ngang tham quan, xuất phát từ hòn Lớn, du khách sẽ mất thêm 30 phút đi chuyền. Hòn Ngang vốn được xem là bến cảng chính của Nam Du bởi nơi đây có mặt nước phẳng lặng và đặc biệt rất kín gió. Tại hòn Ngang có rất nhiều lồng cá bè được nuôi và du khách khi đến đây có thể chọn cho mình những loại hải sản tươi ngon nhất để có thể thưởng thức. Có thể nói hòn Ngang chính là một trong những địa điểm đẹp và nổi tiếng bậc nhất ở Nam Du.

Trọn bộ kinh nghiệm du lịch Côn Đảo 2023 tự túc siêu tiết kiệm;


Hòn Lại Sơn;
Lại Sơn hạy còn gọi là hòn Sơn, Sơn Rái vốn là một trong số 4 xã đảo của huyền đảo Kiên Hải. Cảnh đẹp tại hòn Lại Sơn thực sự khiến bất cứ ai khi lần đầu đặt chân đến chiêm ngưỡng cũng đều phải trầm trồ ngợi khen. Đó chính là sự kết hợp vô cùng hài hòa giữa biển, mây, trời, cỏ cây tạo nên một không gian yên ả và thanh bình đến lạ.

Vào những ngày trời đẹp và mây quang đãng, hòn Lại Sơn nhìn từ xa trông giống hệt như một viên ngọc lấp lánh nhấp nhô trên sóng nước. Nơi hấp dẫn nhất ở hòn Lại Sơn chính là bãi Thiên Tuế, nổi bật với những tảng đá lớn có muôn hình vạn trạng đang hiện lên sừng sững trông vô cùng lạ mắt.
Hòn Lại Sơn;
Lại Sơn hạy còn gọi là hòn Sơn, Sơn Rái vốn là một trong số 4 xã đảo của huyền đảo Kiên Hải. Cảnh đẹp tại hòn Lại Sơn thực sự khiến bất cứ ai khi lần đầu đặt chân đến chiêm ngưỡng cũng đều phải trầm trồ ngợi khen. Đó chính là sự kết hợp vô cùng hài hòa giữa biển, mây, trời, cỏ cây tạo nên một không gian yên ả và thanh bình đến lạ.

Vào những ngày trời đẹp và mây quang đãng, hòn Lại Sơn nhìn từ xa trông giống hệt như một viên ngọc lấp lánh nhấp nhô trên sóng nước. Nơi hấp dẫn nhất ở hòn Lại Sơn chính là bãi Thiên Tuế, nổi bật với những tảng đá lớn có muôn hình vạn trạng đang hiện lên sừng sững trông vô cùng lạ mắt.

.', 'canh2.jpg', 'canh2.jpg');
INSERT INTO `TinTuc` VALUES (3, 'Bật mí 1 số tour du lịch trong nước hấp dẫn 2023 tại Du Lịch Việt', 
'Các tour du lịch trong nước tại Du Lịch Việt luôn là chương trình được nhiều khách hàng quan tâm và lựa chọn đặt tour bởi vẻ đẹp thiên nhiên hùng vĩ, thơ mộng từ các điểm tham quan thú vị trải dài trên khắp dải đất hình chữ S Việt Nam. Tour trong nước được khởi hành từ Hà Nội, TP. HCM với nhiều phương tiện như máy bay, xe du lịch đời mới phục vụ cho chuyến đi của du khách được an toàn và thuận tiện nhất.
Đặc biệt trong năm 2023, vào dịp lễ 30/04 - 01/05 kéo dài 5 ngày nghỉ, Du lịch Việt đã tung ra nhiều chương trình tour du lịch trong nước 30/04 đa dạng về điểm tham quan có lịch trình khởi hành cụ thể và giá cả phù hợp. ;
Du lịch Hà Giang ;
Hà Giang là một tỉnh miền núi biên giới ở cực bắc của Tổ quốc, nơi địa đầu của Tổ quốc với những ngọn núi cao, thiên nhiên kỳ vĩ tuyệt đẹp khắp 4 mùa. Nổi tiếng với những cánh đồng hoa Tam Giác Mạch tuyệt đẹp, cột cờ Lũng Cú đứng sừng sững, hay cao nguyên đá Đồng Văn hoang sơ. 
Là nơi có nhiều sản phẩm văn hóa đặc sắc từ truyền thống lâu đời của hơn 20 dân tộc, một địa danh du lịch đáng nhớ bởi cảnh quan thiên nhiên và con người ở đây. Đến với du lịch Hà Giang, du khách có thể thấy được những sản phẩm kết tinh từ truyền thống văn hóa độc đáo của người miền núi, đó là các loại khăn thêu, túi vải, áo váy với các loại hoa văn rực rỡ.;
Du lịch Phú Quốc ;
Phú Quốc thuộc tỉnh Kiên Giang, là cái tên rất quen thuộc với các du khách từ mọi miền đất nước và cả khách du lịch quốc tế. Nơi đây được mệnh danh là hòn đảo ngọc xinh đẹp của tỉnh Kiên Giang, sở hữu nhiều bãi biển đẹp và gần 100 ngọn núi đồi nguyên sinh với hệ động thực vật vô cùng đa dạng thu hút khách du lịch trên khắp thế giới.
Khi du lịch Bắc đảo Phú Quốc, du khách có thể ghé thăm quan những điểm đến nổi tiếng như làng chài Rạch Vẹm, Hòn Một, Bãi Dài, VinWonders Phú Quốc và Vinpearl Safari Phú Quốc, Grand World Phú Quốc… 
Ngoài ra, bạn cũng đừng nên bỏ qua những điểm du lịch địa phương ở Phú Quốc như:  Vườn tiêu Phú Quốc, chợ đêm Dinh Cậu, Chợ đêm Phú Quốc... Cùng với đó là các món hải sản ngon - bổ - rẻ như nhum biển nướng, gỏi cá trích, ghẹ Hàm Ninh,...
;
Du lịch Miền Tây ;
Miền Tây là vùng đất yên bình mang vẻ đẹp hiền hòa, con người nơi đây thân thiện, hiếu khách. Du lịch Miền Tây - mang vẻ đẹp đặc trưng của vùng đồng bằng sông nước Cửu Long có các hệ sinh thái như du lịch trên sông nước, các khu vườn cây trái xum xuê trĩu quả, khám phá các cù lao. 
Du lịch miền Tây sẽ cho bạn trải nghiệm nét văn hóa mua bán trên sông đặc thù của người dân Nam Bộ tại chợ nổi Cái Răng – một trong những khu chợ lớn nhất Đồng Bằng sông Cửu Long,khám phá Miệt Vườn Nam Bộ với vườn cây trái xum xuê và lò hủ tiếu, dưới khu rừng Tràm Trà Sư Châu Đốc, độc đáo với hàng ngàn – vạn con cò vạc.
Trên đây là một số địa điểm du lịch 3 miền Bắc - Trung - Nam của tour du lịch trong nước. Qua bài viết này, hi vọng bạn đã có cho mình lựa chọn điểm đến phù hợp cho hành trình du lịch của mình..'
, 'vinhHL.jpg', 'vinhHL.jpg');
INSERT INTO `TinTuc` VALUES (4, 'Lưu lại ngay 4 tọa độ săn mây cực chill khi đi tour du lịch Đà Lạt', 
'Du lịch Đà Lạt vẫn chưa bao giờ ngừng hot đối với những bạn trẻ, những ai yêu thích sự lãng mạn của thành phố ngàn hoa này. Lưu lại ngay 5 tọa độ săn mây cực hot này để có thể khám phá trong hành trình vi vu Đà Lạt sắp tới nhé!

Săn mây là một trong những hoạt động đặc sắc được nhiều khách du lịch Đà Lạt quan tâm khi đến với thành phố sương mù này. Hãy để Du Lịch Việt gợi ý cho bạn list 6 tọa độ săn mây cực chill được nhiều người tìm đến nhất tại Đà Lạt bạn nhé!;

Đồi chè cầu Đất;
Đồi chè Cầu Đất sở hữu diện tích rộng lớn lên đến 230ha và đặc biệt đã có tuổi đời lên đến 100 năm tuổi. Nằm ở độ cao hơn 1600m so với mực nước biển, tại đồi chè Cầu Đất, khách du lich Da Lat sẽ có thể săn được cảnh mây tuyệt đẹp vào mỗi buổi sớm tinh mơ. Bạn sẽ được đắm chìm trong lớp sương mù và mây trắng lơ lửng vào mỗi buổi sáng sớm, khi những giọt sương vẫn đang còn đọng lại trên những lá chè, khung cảnh hiện ra lúc này đã tạo nên một bức tranh thiên nhiên tuyệt đẹp tràn ngập màu sắc.

Địa chỉ đồi chè Cầu Đất: Phát Chi, Đà Lạt, tỉnh Lâm Đồng;

Trại Mát;
Bên cạnh việc cung cấp nông sản tươi ngon cho các tỉnh thành trên khắp cả nước thì Trại Mát còn nổi tiếng là một địa điểm săn mây cực thú vị dành cho du khách đi tour du lich Da Lat. Thời điểm từ 5h00 - 6h00 sáng sẽ là lúc thích hợp để bạn có thể chiêm ngưỡng được khung cảnh mây trôi lửng lờ tại đây, thật sự làm say đắm lòng người.

Địa chỉ Trại Mát: phường 11, Đà Lạt, tỉnh Lâm Đồng;


Đồi Thiên Phúc Đức;
Đồi Thiên Phúc Đức là địa điểm săn mây nằm gần trung tâm thành phố và được đông đảo du khách tìm đến khi đi tour du lịch Đà Lạt. Tại đây, bạn sẽ có thể hòa mình vào khung cảnh trong lành của thiên nhiên, chiêm ngưỡng những áng mây trôi bồng bềnh vào mỗi buổi sáng tinh mơ. Đặc biệt, du khách cũng có thể trải nghiệm hoạt động cắm trại qua đêm, tổ chức những buổi tiệc nướng thân mật để có thể cùng nhau ghi lại những phút giây khó quên.

Địa chỉ Đồi Thiên Phúc Đức: phường 7, Đà Lạt, tỉnh Lâm Đồng

Đỉnh Rada
Đỉnh Rada là một địa điểm săn mây nổi tiếng tại Đà Lạt với khung cảnh đẹp hệt như trong tranh vẽ. Từ khu vực đỉnh núi Rada, du khách sẽ có thể thỏa sức check in để cho ra được nhiều bức ảnh sống ảo tuyệt đẹp, bao quát được toàn cảnh thành phố mộng mơ hiện ra trước mắt. Khi săn mây tại đỉnh Rada trong tour Đà Lạt, bạn sẽ có thể được tận hưởng vẻ đẹp huyền ảo của những áng mây trôi lửng lờ và có cảm giác hệt như đang đứng cạnh những đám mây ấy vậy.

Địa chỉ Đỉnh Rada: thị trấn Lạc Dương, huyện Lạc Dương, tỉnh Lâm Đồng

Đồi Du Sinh
Đồi Du Sinh là một địa điểm săn mây còn mới mẻ và chưa thật sự được nhiều người biết đến nên vẫn còn giữ được vẹn nguyên vẻ đẹp hoang sơ vốn có. Đến đồi Du Sinh săn mây, bạn chắc chắn sẽ bị choáng ngợp trước vẻ đẹp hùng vĩ của thiên nhiên và hoàn toàn đắm mình trong những đám mây đang trôi bồng bềnh. Một lưu ý nhỏ là vì nơi đây còn khá hoang vắng nên bạn không nên cắm trại qua đêm tại đồi Du Sinh và chỉ đi săn mây cùng với một nhóm đông người.

Địa chỉ Đồi Du Sinh: số 143 Y Dinh, phường 4, thành phố Đà Lạt, tỉnh Lâm Đồng

Hy vọng rằng những gợi ý trên từ Công ty du lịch sẽ giúp bạn có thể tìm được một địa điểm săn mây lý tưởng trong tour Da Lat. Đừng quên chuẩn bị thật kỹ tư trang trước khi xuất phát bạn nhé!

', 'dlat.jpg', 'dlat.jpg');
INSERT INTO `TinTuc` VALUES (5, 'Hành trình du lịch Sapa, khám phá tu viện cổ Tả Phìn đầy ma mị', 
'Mặc dù không phải là một địa điểm quá nổi tiếng nhưng tu viện cổ Tả Phìn vẫn luôn có một sức hút rất lớn đối với khách du lịch Sapa. Vậy có điều gì đặc biệt ở nơi này mà lại khiến nhiều người tò mò đến vậy?

Sở hữu một vẻ đẹp ma mị cuốn hút nhưng cũng không kém phần dịu dàng, tu viện cổ Tả Phìn giống hệt như một thành phố bị lãng quên ngay giữa lòng Sapa vốn bình yên và mộng mơ. Tu viện Tả Phìn nằm tách biệt hoàn toàn với thị trấn tấp nập và được nhiều khách du lịch Sapa tìm đến khám phá. Trong bài viết dưới đây, bạn hãy cùng theo chân Du Lịch Thanh Tùng cùng khám phá nét đẹp cổ kính đầy ma mị của tu viện cổ Tả Phìn này nhé!;

Tìm hiểu tu viện cổ Tả Phìn nằm ở đâu?;
Tu viện cổ Tả Phìn nằm tại bản Tả Phìn, cách trung tâm thị trấn khoảng chừng 12km. Nơi đây mang một vẻ đẹp khác hoàn toàn so với những gì bạn thường thấy ở Sapa, đó là những thửa ruộng bậc thang hay khung cảnh núi non trùng điệp. 

Tu viện cổ Tả Phìn mang đậm dấu ấn thời Pháp thuộc với đặc trưng là những bức tường đá nhuốm màu rêu phong. Tu viện cổ Tả Phìn là một địa điểm du lich Sapa ấn tượng, thu hút nhiều người tìm đến khám phá. Ngoài ra khi đến đây tham quan, bạn còn có thể đi dạo quanh khu vực tu viện, vừa được ngắm nhìn phong cảnh thiên nhiên bình yên lại có thể chiêm ngưỡng cảnh đẹp ở đường đi đến tu viện cổ.;

Hướng dẫn cách di chuyển đến tu viện cổ Tả Phìn khi du lịch Sapa;
Để có thể đến được hòn Ngang tham quan, xuất phát từ hòn Lớn, du khách sẽ mất thêm 30 phút đi chuyền. Hòn Ngang vốn được xem là bến cảng chính của Nam Du bởi nơi đây có mặt nước phẳng lặng và đặc biệt rất kín gió. Tại hòn Ngang có rất nhiều lồng cá bè được nuôi và du khách khi đến đây có thể chọn cho mình những loại hải sản tươi ngon nhất để có thể thưởng thức. Có thể nói hòn Ngang chính là một trong những địa điểm đẹp và nổi tiếng bậc nhất ở Nam Du.;

Hướng dẫn cách di chuyển đến tu viện cổ Tả Phìn khi du lịch Sapa;
Nằm cách trung tâm thị trấn Sapa khoảng hơn 12km nên việc di chuyển đến tu viện cổ Tả Phìn để tham quan cũng tương đối thuận tiện. Nếu muốn khám phá một cách trọn vẹn vẻ đẹp cổ kính và huyền bí của nơi này, bạn sẽ xuất phát từ trung tâm thị trấn Sapa, bạn thuê xe máy với mức giá dao động từ 80.000 – 100.000 đồng/ xe (tùy vào loại xe khác nhau). 

Nếu không muốn tự đi xe, du khách đi tour du lich Sapa có thể thuê những chú xe ôm để đến tham quan tu viện cổ Tả Phìn với mức giá nhỉnh hơn, khoảng 150.000 đồng. Hoặc nếu di chuyển theo đám đông, bạn có thể cân nhắc chọn taxi để đến với tu viện cổ Tả Phìn. Những người dân ở địa phương sẽ đóng vai trò là hướng dẫn viên du lịch giúp bạn giải đáp thắc mắc về địa điểm tham quan này.;
Khám phá nét kiến trúc ấn tượng của tu viện cổ Tả Phìn;
Lại Sơn hạy còn gọi là hòn Sơn, Sơn Rái vốn là một trong số 4 xã đảo của huyền đảo Kiên Hải. Cảnh đẹp tại hòn Lại Sơn thực sự khiến bất cứ ai khi lần đầu đặt chân đến chiêm ngưỡng cũng đều phải trầm trồ ngợi khen. Đó chính là sự kết hợp vô cùng hài hòa giữa biển, mây, trời, cỏ cây tạo nên một không gian yên ả và thanh bình đến lạ.

Vào những ngày trời đẹp và mây quang đãng, hòn Lại Sơn nhìn từ xa trông giống hệt như một viên ngọc lấp lánh nhấp nhô trên sóng nước. Nơi hấp dẫn nhất ở hòn Lại Sơn chính là bãi Thiên Tuế, nổi bật với những tảng đá lớn có muôn hình vạn trạng đang hiện lên sừng sững trông vô cùng lạ mắt.
Khám phá nét kiến trúc ấn tượng của tu viện cổ Tả Phìn
Đi tour du lịch Sapa, nếu đến tu viện cổ Tả Phìn, hình ảnh đầu tiên xuất hiện trước mắt bạn chính là một công trình đã đổ nát và hoang tàn, ẩn hiện ngay giữa làn sương mờ ảo nơi phố núi. Xung quanh tu viện cổ này là những rừng cây cối rậm rạp khiến bạn liên tưởng đến khung cảnh thường thấy trong những câu chuyện cổ tích.Bất cứ ai khi lần đầu đặt chân đến tu viện cổ Tả Phìn cũng đều bị xiêu lòng trước nét đẹp rất riêng của nó. Đâu đó sẽ phảng phất chút xưa cũ, chút hoài niệm và huyền bí khiến bạn có cảm giác hệt như đang bước chân vào khung cảnh phim truyện thời xưa. 

Tu viện cổ Tả Phìn là một công trình kiến trúc được xây dựng nên từ đá ong để giữ được sự kiên cố. Cổng tu viện đi theo lối vòm bề thế, mang nét kiến trúc cổ điển của nước Pháp. Tổng thể cấu trúc này nhìn chung sẽ gồm có một nhà ngang có mặt hướng về phía Tây. Trước đây, tu viện này có 5 gian, 1 cầu thang và 3 tầng. Nhà ngang sẽ là nơi sinh hoạt của các vị nữ tu sĩ. Ngoài ra, phía bên phải tòa nhà còn có thêm một nhà dọc nối liền với nhà ngang được dùng để cất trữ đồ đạc, lương thực.

Mặc dù đã bị bỏ hoang từ rất lâu nhưng tu viện cổ Tả Phìn vẫn luôn có một sức hút rất lớn đối với khách du lịch Sapa bởi không gian trầm mặc, kiến trúc cổ kính ấn tượng. Sự kết hợp giữa kiến trúc cổ điển kết hợp với chút ma mị đã khiến cho bất cứ ai lần đầu đặt chân đến tu viện cổ Tả Phìn cũng đều phải trầm trồ.

Trên đây là tổng hợp những thông tin của Công ty du lịch về làng tu viện cổ Tả Phìn. Với vẻ đẹp huyền bí, nhuốm bụi mờ thời gian, tu viện cổ Tả Phìn chính là một không gian hoàn toàn tách biệt với ồn ào náo nhiệt của thị trấn Sapa. Nếu có dịp đi tour Sapa, nhất định đừng bỏ lỡ cơ hội đến tham quan tu viện cổ Tả Phìn để có thể chiêm ngưỡng vẻ đẹp của nơi này bạn nhé!


.'
, 'tapin1.jpg', 'tapin.jpg');
INSERT INTO `TinTuc` VALUES (6, 'Kinh nghiệm du lịch Nha Trang 2023 siêu tiết kiệm ai cũng nên biết', 
'Bạn đang lên kế hoạch cho chuyến du lịch Nha Trang 2023 nhưng vẫn đang loay hoay không biết nên bắt đầu từ đâu? Lưu lại ngay những kinh nghiệm du lịch tự túc siêu tiết kiệm mà Du Lịch Việt đã tổng hợp bên dưới để có thể chuẩn bị thật tốt cho chuyến đi sắp tới nhé!

Bạn đang lên kế hoạch cho chuyến du lịch Nha Trang 2023 nhưng vẫn đang loay hoay không biết nên bắt đầu từ đâu? Lưu lại ngay những kinh nghiệm du lịch tự túc siêu tiết kiệm mà Du Lịch Việt đã tổng hợp bên dưới để có thể chuẩn bị thật tốt cho chuyến đi sắp tới nhé!!;

Du lịch Nha Trang đi mùa nào đẹp?;
Khí hậu ở Nha Trang có đặc điểm tương đối ôn hòa, mùa khô thường kéo dài từ tháng 1 đến tháng 8 và sẽ không có mùa đông quá lạnh. Vậy nên khách du lich Nha Trang có thể đến đây vào bất cứ thời điểm nào trong năm. 

Thời điểm từ tháng 4 đến tháng 6, Nha Trang sẽ có nắng và nóng nhiều hơn nhưng trời sẽ không quá oi bức. Tháng 9 ở Nha Trang bắt đầu xuất hiện mưa rải rác, tuy nhiên điều này sẽ không làm ảnh hưởng quá nhiều đến các hoạt động vui chơi giải trí của du khách. Từ tháng 10 đến tháng 12, thời tiết ở Nha Trang sẽ có mưa nhiều hơn và có kèm theo khí lạnh xuất hiện. Lúc này không còn là thời điểm du lịch cao điểm của Nha Trang và nếu như bạn muốn đến du lịch nghỉ dưỡng thì đây sẽ là khoảng thời gian thích hợp nhất.;


Phương tiện di chuyển đến Nha Trang là gì?;
Theo kinh nghiệm đi tour du lịch Nha Trang thì dưới đây sẽ là những phương tiện di chuyển tốt nhất dành cho bạn:

Máy bay: Tại Nha Trang có sân bay Cam Ranh và du khách có thể lựa chọn đặt vé máy bay theo tuyến Hà Nội - Nha Trang hoặc tuyến Sài Gòn - Nha Trang. Thời gian di chuyển đến Nha Trang khá nhanh chóng nên máy bay sẽ là một sự lựa chọn thích hợp cho bạn.

Tàu hoả: Ga ở Nha Trang là một trong những ga chính thuộc tuyến đường sắt Bắc - Nam. Việc di chuyển bằng tàu hỏa sẽ khá chậm tuy nhiên du khách sẽ có thể được thoải mái ngắm nhìn khung cảnh tuyệt đẹp nếu di chuyển bằng hình thức này.

Xe khách giường nằm: Xuất phát từ Hà Nội hay Sài Gòn đều sẽ có rất nhiều tuyến xe giường nằm đến Nha Trang. Nếu xuất phát từ Hà Nội, bạn sẽ mất khoảng 1 ngày và nếu đi từ Sài Gòn sẽ mất khoảng 7-8 giờ là đã có thể đến được Nha Trang.;


Top những đặc sản hấp dẫn nên thử khi du lịch Nha Trang;
Đi tour du lich Nha Trang, hãy lưu lại danh sách những món đặc sản ngon nức tiếng này để có thể thưởng thức nhé:

Bánh căn: Bánh căn hay còn có tên gọi khác là bánh bột gạo nướng, có hình tròn, vỏ bánh mềm và phần nhân đa dạng gồm nhiều nguyên liệu khác nhau như bột gạo, trứng, tôm, mực, thịt bằm dùng kèm với xoài chua và các loại rau. 

Bánh canh chả cá: Nằm trong danh sách những món ngon đặc sản của thành phố biển Nha Trang, bún chả cá là một món ăn được đông đảo khách du lịch yêu thích. Hương vị thanh ngọt từ xương cá kết hợp với sợi bánh canh mềm mại đã tạo nên một món đặc sản ngon khó cưỡng mà bất cứ ai cũng nên thử khi đến du lịch Nha Trang.

Nem Ninh Hoà: Đây là một món đặc sản Nha Trang trứ danh có vị ngon ấn tượng. Đã đến Nha Trang du lịch nhất định nên thưởng thức món ngon đặc sản này bạn nhé.Một số địa điểm vui chơi hấp dẫn dành cho bạn khi đến Nha Trang
Đi tour Nha Trang, đâu là những địa điểm tham quan thú vị dành cho bạn? Lưu lại ngay những gợi ý dưới đây nhé!

Tháp bà Ponagar: Đây là một công trình kiến trúc lâu đời của người Chăm được xây dựng từ thế kỷ thứ VIII cho đến thế kỷ thứ XIII. Đến đây, du khách không chỉ có cơ hội được chiêm ngưỡng nét kiến trúc cổ kính độc đáo mà còn được tìm hiểu về những nét văn hóa vô cùng thú vị.

Chùa Long Sơn: Chùa Long Sơn hay còn được gọi là chùa Phật Trắng, nơi sở hữu bức tượng Phật trắng Kim Thân Phật vô cùng nổi tiếng tọa lạc trên đỉnh đồi Trại Thuỷ. Chùa Long Sơn đã được xây dựng từ tận thế kỷ XIX và đồng thời cũng được chứng nhận là ngôi chùa có tuổi thọ lớn nhất tại Việt Nam.

Vinpearl Land: Tọa lạc tại khu vực đảo Hòn Tre, Vinpearl Land Nha Trang sở hữu một hệ thống khu vui chơi vô cùng đẳng cấp xứng tầm quốc tế. Đây là một địa điểm vui chơi giải trí vô cùng thú vị dành cho bạn.

Mong rằng bài viết trên đã mang đến cho bạn những thông tin, những kinh nghiệm hữu ích cho tour Nha Trang sắp tới. Lưu lại ngay những thông tin này của Công ty du lịch để có được một chuyến vi vu Nha Trang thật nhiều niềm vui nhé!

.'
, 'nhatrang1.jpg', 'nhatrang1.jpg');
INSERT INTO `TinTuc` VALUES (7, 'List vài quán ăn vặt ngon - bổ - rẻ không thể bỏ qua khi du lịch Hạ Long',
 'Danh sách những địa điểm ăn ngon nức tiếng dưới đây không chỉ có thể giúp bạn “lấp đầy dạ dày” mà còn có thể thưởng thức nhiều món ngon đặc sản khi đến du lịch Hạ Long nữa đấy!

Ẩm thực Hạ Long luôn có một sức hút rất lớn với khách du lịch bởi sự độc đáo và đa dạng vốn có. Nếu có dịp du lịch Hạ Long vào thời gian tới, bạn nhất định phải lưu lại ngay danh sách 5 quán ăn vặt nổi tiếng ngon - bổ - rẻ mà Du Lịch Thanh Tùng đã tổng hợp trong bài viết dưới đây nhé!;

Bánh cuốn chả mực;
Nếu đặt chân đến du lịch Hạ Long mà không một lần thưởng thức món đặc sản bánh cuốn chả mực thì quả là một điều đáng tiếc lớn. Đặc biệt, thưởng thức món đặc sản này tại số 34 đường Đoàn Thị Điểm sẽ là một gợi ý tuyệt vời dành cho bạn. Bánh cuốn nóng hổi thơm ngon kết hợp cùng với miếng chả mực giòn sần sật chắc chắn sẽ mang đến một hương vị ngon khó cưỡng.

Giờ mở cửa: từ 7h sáng đén 14h chiều
Giá: dao động khoảng từ 30.000đ - 55.000đ
Địa chỉ: số 34 đường Đoàn Thị Điểm, Bạch Đằng, thành phố Hạ Long;


Quán ăn vặt Cô Béo;
Nhắc đến những quán ăn vặt ngon, nổi tiếng mà du khách đi tour du lịch Hạ Long nhất định không nên bỏ lỡ chắc hẳn phải kể đến quán ăn vặt Cô Béo. Ưu điểm nổi bật của quán ăn này chính là đồ ăn tươi ngon, menu đa dạng các món và đặc biệt cô chủ lại nhiệt tình và vui tính. Chính nhờ những ưu điểm này mà quán ăn vặt Cô Béo đã rất nổi tiếng và được đông đảo khách du lịch tìm đến để thưởng thức.

Giờ mở cửa: từ 8h sáng đến 22h30 mỗi ngày
Địa chỉ: B111, Ki ốt Sun Word Halong Park, thành phố Hạ Long;


Quán Sam bà Tỵ;
Nhắc đến đặc sản Hạ Long chắc chắn không thể nào bỏ qua món sam vô cùng nổi tiếng. Không chỉ xuất hiện trong menu của các nhà hàng lớn mà món sam còn được bày bán tại nhiều quán vỉa hè và Sam bà Tỵ là một trong những cái tên được nhắc đến nhiều nhất. Tại quán ăn này, các món ăn không chỉ tươi ngon đặc trưng mà còn có giá thành khá mềm, rất thích hợp để bạn tìm đến tụ tập thưởng thức cùng bạn bè trong tour du lich Ha Long sắp tới.

Giờ mở cửa: từ 7h sáng đến 23h khuya 
Giá: dao động khoảng từ 20.000đ - 100.000đ
Địa chỉ: Tổ 7, khu 4, Hạ Long

.'
 , 'hoqua.jpg', 'hoqua.jpg');
INSERT INTO `TinTuc` VALUES (8, 'Du lịch Hạ Long, check in đỉnh thiêng Yên Tử đẹp hệt như chốn bồng lai',
 'Nếu có dịp du lịch Hạ Long, bạn nhất định nên một lần ghé qua đất Phật Yên Tử để có thể tham quan và chiêm bái chốn linh thiêng này. Cùng Du Lịch Việt tìm hiểu xem nơi đây có gì thú vị bạn nhé!

Cứ mỗi độ xuân về, đất Phật Yên Tử lại được nhiều du khách lẫn phật tử đổ về tham quan chiêm bái. Đặc biệt, nơi đây còn diễn ra rất nhiều hoạt động lễ hội sôi nổi khiến bất cứ khách du lịch Hạ Long nào cũng mong muốn được một lần trải nghiệm. Ngay bây giờ, hãy cùng Du Lịch Thang Tùng tìm hiểu những kinh nghiệm tham quan thú vị để có thể ghé đến Yên Tử trong chuyến du lịch sắp tới nhé!;

Nên đến Yên Tử tham quan vào thời điểm nào trong năm?;
Mặc dù lễ hội Yên Tử sẽ được tổ chức từ ngày 10 tháng giêng cho đến hết tháng 3 âm lịch hàng năm nhưng theo kinh nghiệm của Du Lịch Việt, đây chính là mùa cao điểm, có thể sẽ khiến cho hành trình khám phá của bạn không được trọn vẹn. Vào thời điểm này, Yên Tử sẽ phải tiếp đón hàng ngàn người chen chúc đến đỉnh chùa Đồng cúng bái nên có thể khiến cho du khách cảm thấy ngộp. 

Tuy nhiên, nếu không quá quan tâm đến vấn đề này, bạn sẽ có được một tour du lịch Hạ Long tuyệt vời khi đến núi Yên Tử tham gia nhiều hoạt động lễ hội đầu năm vô cùng thú vị. Nếu lựa chọn đi du lịch núi Yên Tử vào thời điểm khác trong năm, bạn sẽ có thể ngắm nhìn trọn vẹn vẻ đẹp thanh tịnh, không gian vô cùng yên tĩnh với bầu không khí trong lành, thư giãn của vùng đất này.;

Hướng dẫn đường đến núi Yên Tử;
Hướng dẫn đường đến núi Yên Tử

Đi bộ: Hình thức này sẽ phù hợp với những ai có thể lực tốt và yêu thích trải nghiệm, khám phá. Bạn sẽ bắt đầu từ bãi đỗ xe, đi khoảng 300m đến suối Giải Oan và leo qua đường Tùng cổ hơn 700 năm tuổi để đến được Tháp Tổ, chùa Hoa Yên, chùa Một Mái rồi đến chùa Bảo Sái, chùa Đồng. Thời gian di chuyển sẽ dao động khoảng 6 - 8 tiếng nếu như không quá đông đúc

Đi cáp treo: Nếu lựa chọn đi tour du lich Ha Long, đến núi Yên Tử bằng cáp treo, bạn sẽ mất khoảng 3 - 4 tiếng di chuyển. Ngoài ra, với việc đi cáp treo, bạn sẽ có thể được ngắm nhìn những rừng cây hùng vĩ hiện ra trước mắt khi ngắm nhìn từ trên cao.;


Một vài điểm tham quan đặc sắc tại Yên Tử ;
Khám phá Yên Tử trong tour Hạ Long, bạn sẽ có thể tham quan được nhiều địa điểm thú vị, cụ thể đó là:

Chùa Trình (hay còn được gọi là chùa Bí Thượng): Đây là một ngôi chùa nằm ngay tại cửa ngõ Yên Tử, là nơi mà du khách thập phương sẽ thực hành tín lễ “đi trình về tạ” mỗi khi hành hương về núi Yên Tử.  

Thiền viện Trúc Lâm Yên Tử: Đây là nơi tu học của các vị nhà sư và cư sĩ, bạn hoàn toàn có thể ghé qua nơi này tham quan trước khi leo núi Yên Tử.

Tháp Huệ Quang: Ngọn tháp này là nơi cất giữ một phần xá lị của vua Trần Nhân Tông, phần còn lại hiện đang được thờ ở khu đền Trần tại Nam Định. Tại đây, du khách sẽ được chứng kiến những cây tùng, cây đại có tuổi đời lên đến hàng trăm năm đang vươn mình che nắng che mưa cho tháp.

Chùa Hoa Yên: Nơi này vốn là ngôi chùa trung tâm lớn nhất khu di tích Yên Tử. Chùa Hoa Yên vốn có tên là Vân Yên mang hàm ý “chùa trên tận núi cao, quanh năm mây phủ, mây trắng trôi lững lờ tựa như mây khói trên núi”.

Yên Tử vốn là một điểm đến du lịch thú vị thách thức lòng thành tâm của các thiện nam tín nữ. nếu có dịp đi tour Ha Long, bạn nhất định nên một lần ghé qua nơi này để chiêm ngưỡng kiến trúc độc đáo và khám phá nhiều điều thú vị nhé!


.'
 , 'yentu1.jpg', 'yentu1.jpg');
INSERT INTO `TinTuc` VALUES (9, 'Trọn bộ kinh nghiệm khám phá bãi Nhát khi đi du lịch Côn Đảo',
 'Nếu là một người muốn tìm đến những gì thân quen và hoang sơ nhất của thiên nhiên khi đi tour du lịch Côn Đảo thì bãi Nhát chính là một địa điểm lý tưởng mà bạn nhất định nên một lần ghé đến!

Với những ai yêu thích du lịch biển thì tour du lịch Côn Đảo chắc chắn sẽ là thiên đường dành cho bạn. Một trong những địa điểm mang vẻ đẹp hoang sơ mà bạn nhất định nên ghé đến tại Côn Đảo đó chính là bãi Nhát. Vậy du lịch bãi Nhát có gì thú vị, lưu lại ngay những kinh nghiệm tham quan hữu ích mà Du Lịch Thanh Tùng đã tổng hợp bên dưới nhé!;

Bãi Nhát ở đâu?;
Bãi Nhát nằm gần trung tâm thị trấn và bãi An Hải ở Côn Đảo, được xem là một trong những bãi biển đẹp nhất tại đây. Bãi Nhát nằm trên trục đường chính nối liền thị trấn Côn Đảo và Bến Đầm, đây được xem là trục đường biển đẹp nhất của Côn Đảo với một bên là núi đồi hùng vĩ, bên còn lại là biển xanh cát trắng thơ mộng.

Con đường quanh co và uốn lượn tại bãi Nhát kết hợp với sự hùng vĩ của thiên nhiên chắc chắn sẽ khiến bạn say đắm trước khung cảnh tuyệt đẹp này. Lựa chọn đến du lich Con Dao, được tận hưởng bầu không khí trong lành và mát lạnh tại bãi Nhát thực sự là một trải nghiệm tuyệt vời mà bạn nhất định không nên bỏ lỡ.;

Khám phá bãi đá tuyệt đẹp tại bãi Nhát;
Bãi Nhát không có những rặng san hô rực rỡ hay hệ sinh thái phong phú như nhiều bãi biển khác tại Côn Đảo nhưng nơi đây lại sở hữu bãi đá với vô số hình thù độc đáo, có khi ẩn nhưng cũng có lúc hiện trong làn nước trong vắt. Ngồi trên những tảng đá lớn và tận hưởng từng đợt sóng vỗ mát lạnh, ngắm nhìn khung cảnh êm đềm trước mắt quả thực là một trải nghiệm thú vị tại bãi Nhát mà bạn nhất định nên một lần tận hưởng trong tour Côn Đảo sắp tới.


Ngắm đỉnh Tình Yêu lãng mạn cùng với người thương;
Trong hành trình du lịch khám phá bãi Nhát Côn Đảo, bạn chắc chắn không thể không đặt chân đến ngắm nhìn đỉnh Tình Yêu. Đây là một ngọn đồi nằm ngay bên cạnh bãi Nhát và nó có hình thù trông giống hệt như một đôi tình nhân đang ngồi bên cạnh nhau. Chính vì vậy mà nơi đây được gọi là đỉnh Tình Yêu. Khung cảnh thiên nhiên vừa lãng mạn, thanh bình của nơi đây chắc chắn sẽ khiến nhiều người yêu thích, đặt biệt là các cặp đôi.

Hãy đến Bãi Nhát trong tour Con Dao để có thể lưu lại khoảnh khắc tuyệt đẹp lúc xế chiều với ánh hoàng hôn đỏ rực cùng với khung cảnh biển trong vắt đã tạo nên một bức tranh tuyệt đẹp nhé. Đây chắc chắn sẽ là một trải nghiệm mới mẻ và thú vị dành cho bạn đấy!
.'
 , 'cond.jpg', 'cond2.jpg');
INSERT INTO `TinTuc` VALUES (10, 'Tour du lịch Sapa, ghé thăm những bản làng xinh đẹp như bước ra từ cổ tích',
 'Ngoài khung cảnh thiên nhiên hùng vĩ, Sapa còn ấn tượng bởi đa dạng bản sắc văn hóa dân tộc. Hãy cùng Du Lịch Việt khám phá 6 bản làng xinh đẹp & bình yên mà bạn nhất định nên ghé đến trong tour du lịch Sapa nhé!

Dừng chân ở những bản làng xinh đẹp tại Sapa, du khách sẽ có cơ hội được ngắm nhìn một bức tranh thiên nhiên Tây Bắc thơ mộng và hùng vĩ tại các bản làng. Dưới đây là danh sách những bản làng xinh đẹp nổi tiếng yên bình mà bạn nhất định nên một lần ghé đến trong tour du lịch Sapa, hãy cùng Du Lịch Việt khám phá ngay bây giờ nhé!;

Bản Tả Phìn;
Bản Tả Phìn nằm cách trung tâm thị trấn Sapa khoảng chừng 12km, đây vốn là nơi cư ngụ của người đồng bào dân tộc H’mông và người Dao đỏ. Bản Tả Phìn vẫn luôn được đông đảo khách du lich Sapa từ trong lẫn ngoài nước tìm đến khám phá bởi vẻ đẹp hoang sơ và kỳ vĩ vốn có của nó.

Đến bản Tả Phìn tham quan, bạn sẽ có cảm giác mình thật nhỏ bé giữa khung cảnh núi rừng rộng lớn và bình yên bởi nơi đây nằm trong thung lũng bốn mặt là núi. Bản Tả Phìn còn là nơi có nhiều hang động tự nhiên với nhiều điều bí ẩn đang chờ đợi du khách đến khám phá.;

Bản Cát Cát;
Nằm cách trung tâm thị trấn Sapa khoảng 2km, bản Cát Cát tọa lạc ngay dưới dãy núi Hoàng Liên Sơn hùng vĩ và đây cũng chính là nơi sinh sống của đồng bào dân tộc người H’mông. Đến thăm bản Cát Cát trong chuyến du lịch Sapa, bạn sẽ được tìm hiểu rõ hơn về nếp sống mộc mạc, giản dị của người dân nơi đây và còn có thể khám phá nhiều điều thú vị.

Với khung cảnh thiên nhiên hoang sơ, hùng vĩ và thơ mộng, du khách đi tour du lịch Sapa chắc chắn sẽ mê mẩn bức tranh phong cảnh thiên nhiên tuyệt đẹp tại bản Cát Cát. Đặc biệt, khi đến đây du lịch, bạn còn được ngắm nhìn những ngôi nhà nhỏ xinh và hình ảnh những người lao động đang miệt mài với công việc của mình.;


Bản Sâu Chua ;
Nhắc đến những bản làng đẹp ở Tây Bắc, có lẽ Sâu Chua sẽ là một cái tên còn khá xa lạ đối với nhiều người. Bản Sâu Chua nằm cách trung tâm thị trấn Sapa khoảng 8km, vẫn chưa có phát triển mạnh về du lịch nên đang còn giữ được nét đẹp nên thơ rất riêng. Đây là một bản làng được nhiều du khách lựa chọn ghé thăm để có thể tận hưởng được sự yên bình, hoang sơ vốn có của thiên nhiên và núi rừng Tây Bắc.

Trên đây là danh sách những bản làng nổi tiếng với cảnh đẹp yên bình cùng nét văn hóa đặc trưng mà bạn có thể ghé thăm trong tour Sapa. Nếu có dịp đến du lịch Sapa, hãy thử một lần đặt chân đến những bản làng này để có thể trải nghiệm và khám phá nhiều điều mới lạ bạn nhé!
.'
 , 'phin.jpg', 'sin.jpg');
INSERT INTO `TinTuc` VALUES (11, 'Combo Phan Thiết có gì vui? Đâu là những điểm đến bạn không nên bỏ lỡ',
 'Những địa điểm du lịch Phan Thiết vốn sở hữu những nét rất riêng và chắc chắn sẽ mang đến cho bạn nhiều trải nghiệm thú vị. Cùng điểm qua những điểm đến không nên bỏ lỡ trong combo Phan Thiết ngay nhé!

Bạn đang có dự định đặt chân đến Phan Thiết để du lịch khám phá nhưng vẫn đang băn khoăn trong việc lựa chọn địa điểm để trải nghiệm. Vậy combo Phan Thiết có gì thú vị? Ngay bây giờ hãy cùng Du Lịch Việt điểm qua những tọa độ khám phá mới mẻ tại đây nhé!;

Bàu Trắng;
Được ví như một “tiểu Sahara thu nhỏ”, đồi cát Bàu Trắng là một địa điểm du lịch thu hút được đông đảo bạn trẻ đến khám phá vẻ đẹp mênh mông của vùng cát đầy nắng gió. Đứng từ vị trí cồn cát, du khách sẽ có thể nghe được rất rõ âm thanh của gió thổi qua những rặng phi lao cùng với tiếng nước gợn nhẹ vô cùng thú vị.

Đặc biệt, đi du lich Phan Thiet, bạn sẽ thấy hồ nước ở Bàu Trắng vốn rất yên bình với hương sen thơm ngát có thể lấn át được mọi vẻ đẹp của sa mạc và ốc đảo. Đến Bàu Trắng check in, du khách cũng có thể thuê một chiếc thuyền của người dân nơi đây để dạo chơi và câu cá, một trải nghiệm vô cùng thú vị.;

Cù lao Câu;
Cù lao Câu là một địa điểm du lịch tách biệt hoàn toàn với thế giới bên ngoài. Nơi đây vốn đã được tạo hóa ban tặng cho làn nước xanh một màu xanh ngọc bích với những khối núi đá khổng lồ mang đầy đủ hình thù lớn nhỏ. Từ khu vực đất liền nhìn ra cù lao Câu, khách tour du lich Phan Thiet có thể cảm nhận được rõ nét sự hoang sơ, bình dị của thiên nhiên. Bạn hoàn toàn có thể đắm chìm vào trong làn nước mát để thỏa sức tận hưởng giây phút thư giãn, được tránh xa những ồn ào, bộn bề nơi phố thị ngoài kia.;


Núi Tà Cú;
Ngoài các địa điểm du lịch biển nổi tiếng, tour Phan Thiết còn nổi tiếng với núi Tà Cú  sở hữu cánh rừng xanh bạt ngàn. Đây thực sự là một thắng cảnh kỳ vĩ với núi non trùng điệp thấp thoáng đằng sau mái chùa cổ kính. Trên núi Tà Cú có khí hậu mát mẻ rất dễ chịu, du khách đến đây có thể tận hưởng được bầu không khí trong lành, vừa thoáng đãng lại vô cùng dễ chịu.

Hy vọng rằng bài viết trên đã cung cấp cho bạn những thông tin hữu ích về các địa điểm tham quan nổi tiếng trong combo du lịch Phan Thiết. Chúc bạn sẽ có được một chuyến đi tuyệt vời với nhiều trải nghiệm thú vị trong chuyến du lịch này nhé!


.'
 , 'p2.jpg', 'p3.jpg');
INSERT INTO `TinTuc` VALUES (12, 'Những lưu ý cực quan trọng cần khi nhớ khi vi vu trong combo Sài Gòn',
 'Từ chuyện đi lại, ăn uống cho đến việc tham gia các hoạt động vui chơi giải trí, bạn cũng cần cẩn thận và nắm được những lưu ý quan trọng khi đi combo Sài Gòn nhé!

Nếu Sài Gòn là một trong những địa điểm mà bạn chuẩn bị đặt chân đến trong năm 2023 thì đừng bỏ qua những thông tin lưu ý quan trọng mà Du Lịch Việt đã kể ra trong bài viết này nhé! Có không ít những lưu ý tưởng chừng rất đơn giản nhưng lại trở nên vô cùng cần thiết trong combo Sài Gòn sắp tới.;

Lưu ý về văn hóa của người dân Sài Gòn;
Nếu bạn đi du lịch Sài Gòn nhưng có người quen và được mời lại nhà nghỉ ngơi, bạn có thể cân nhắc ở lại hoặc từ chối để đảm bảo sự thoải mái cũng như tính riêng tư. Tại Sài Gòn không thiếu các nhà nghỉ, khách sạn với đủ mọi phân khúc từ bình dân cho đến cao cấp để bạn lựa chọn lưu trú. Đây chính là lưu ý quan trọng đầu tiên dành cho bạn khi đến Sài Gòn du lịch.;

Lưu ý về phương tiện di chuyển khi du lịch Sài Gòn;
Đi du lich Sai Gon cần lưu ý những gì? Ngày nay, ở Sài Gòn có vô vàn các loại phương tiện giao thông để bạn có thể lựa chọn sao cho thuận tiện di chuyển, gồm có taxi, xe máy, xe khách, xe bus,... Lời khuyên chân thành dành cho bạn đó là nên di chuyển bằng taxi để đảm bảo nhanh chóng và tiện lợi nhất. 

Nếu lựa chọn xe bus để di chuyển, ưu điểm của nó là cực rẻ nhưng nếu không thông thạo các bến di chuyển, bạn có thể gặp những tình huống bất lợi. Đối với xe máy, do đặc trưng của Sài Gòn là kẹt xe nên nếu không muốn hít khói bụi, bạn có thể cân nhắc không lựa chọn di chuyển bằng phương tiện này.;


Lưu ý về việc mua sắm khi du lịch Sài Gòn;
Ở Sài Gòn có vô số khu trung tâm thương mại luôn thu hút du khách đi tour du lich Sai Gon nhưng không phải địa chỉ nào cũng phù hợp dành cho bạn. Ví dụ muốn mua sắm hàng hóa bình dân, bạn có thể ghé qua siêu thị hoặc trung tâm Saigon Square. Những nơi như Parkson, Vincom hay Diamond chủ yếu để ngắm nghía vì bày bán rất nhiều đồ hiệu, không phải phù hợp với tất cả mọi người.

Một số khu chợ nổi tiếng mà bạn có thể mua sắm trong tour Sai Gon đo là:

Chợ Bến Thành: bạn có thể đến đây để mua các mặt hàng lưu niệm, đồ thủ công mỹ nghệ.

Chợ Tân Định: chuyên bán các loại vải

Chợ Bà Chiểu: là khu chợ chuyên bán áo quần, nhất là các loại đồ second-hand.

Chợ An Đông: là khu bày bán nhiều loại như áo quần, giày dép, tổ yến,….'
 , 's1.jpg', 's2.jpg');
INSERT INTO `TinTuc` VALUES (13, 'Những quán cà phê chil ở Đà Lạt', 
'Đà Lạt ngoài mang không khí trong lành đặc trưng thì những quán cafe view đẹp chính là thứ khiến nhiều du khách mê mẩn. Đi combo Đà Lạt, bạn nhất định không thể bỏ lỡ 6 quán cafe sở hữu view xịn bậc nhất này!

Ngoài sở hữu không khí trong lành, mát mẻ thì cảnh đẹp của những quán cafe chính là thứ khiến nhiều khách du lịch lưu luyến. Các quán cafe tại Đà Lạt xuất hiện ngày càng nhiều để phục vụ đông đảo du khách ghé đến check in. Vậy đi combo Đà Lạt, bạn còn chần chờ gì nữa mà không ghé đến những quán cafe cực hot mà Du Lịch Việt đã tổng hợp trong bài viết dưới đây?;

Tiệm cà phê Túi Mơ To;
Túi Mơ To là một tiệm cafe nằm trên 1 con dốc nhỏ, được đông đảo bạn trẻ yêu thích và ghé đến, vậy nên bất cứ thời điểm nào trong ngày thì quán cafe này cũng tấp nập khách ra vào. Túi Mơ To được thiết kế mang màu gỗ giản dị, có những luống hoa và thứ đặc sản chắc chắn là view Đà Lạt từ trên cao hút mắt. Thời điểm lý tưởng nhất để khách du lich Da Lat có thể đến check in tiệm cà phê Túi Mơ To và trải nghiệm ngắm nhìn khung cảnh lung linh của Đà Lạt khi về đêm đó là khoảng 9h tối, khi khách bớt đông và không gian cũng bớt đi phần huyên náo.

Địa chỉ: Hẻm 31 Sào Nam, thành phố Đà Lạt, Lâm Đồng;

Tiệm cà phê cô Bông;
Tiệm cà phê cô Bông là một quán cafe mang phong cách vintage khiến nhiều du khách yêu thích và ghé đến check in trong tour Da Lat. Từ những chiếc xe cup nhỏ xinh trước quán cho đến nền gạch hay những chiếc bàn may thủ công tại quán đều mang phong cách cũ kỹ rất ấn tượng. Và nếu như muốn có những bộ ảnh mang đậm chất hoài cổ thì hãy lựa chọn đến tiệm cà phê cô Bông để check in nhé!

Địa chỉ: số 238 Yersin, P.9,  thành phố Đà Lạt, tỉnh Lâm Đồng

Trên đây là top 6 quán cafe có view đẹp ấn tượng, được đông đảo bạn trẻ yêu thích nhất trong combo du lịch Đà Lạt. Mỗi quán đều mang một phong cách riêng vô cùng ấn tượng và nếu có cơ hội hãy một lần đến đây để check in bạn nhé!;


Đà Lạt Mountain View;
Đà Lạt Mountain View là một trong những quán cafe gây được ấn tượng với du khách đi tour Đà Lạt nhờ vào không gian bốn bề được thiết kế bằng gỗ sang trọng, từ sàn nhà, bàn ghế cho đến cầu thang,... Tất cả thiết kế này được lấy nguồn cảm hứng từ phong cách Bắc  u tinh tế, gọn gàng lại không kém phần ấm cúng. Mountain View thực sự sẽ là một địa điểm dừng chân lý tưởng để bạn có thể nhâm nhi những món thức uống ngon lành trong tiết trời se lạnh của Đà Lạt.

Địa chỉ: số 25 Hoàng Hoa Thám, thành phố Đà Lạt, tỉnh Lâm Đồng
.'
, 'd1.jpg', 'd2.jpg');
