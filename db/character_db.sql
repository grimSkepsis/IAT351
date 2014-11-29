-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2014 at 12:15 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `character_db`
--
CREATE DATABASE IF NOT EXISTS `character_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `character_db`;

-- --------------------------------------------------------

--
-- Table structure for table `character_combos`
--

DROP TABLE IF EXISTS `character_combos`;
CREATE TABLE IF NOT EXISTS `character_combos` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `inputs` varchar(500) NOT NULL,
  `pros` varchar(500) NOT NULL,
  `cons` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `character_lore`
--

DROP TABLE IF EXISTS `character_lore`;
CREATE TABLE IF NOT EXISTS `character_lore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `header` varchar(200) NOT NULL,
  `quote` varchar(200) NOT NULL,
  `body` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `character_lore`
--

INSERT INTO `character_lore` (`id`, `character_id`, `header`, `quote`, `body`) VALUES
(2, 2, 'Athena Asamiya, The Psychic-Powered Idol', '"I didn''t see it before, but I see it now... You are carrying some kind of determination in your heart."', 'Athena Asamiya is a character originally from the former SNK''s video game Psycho Soldier and a distant relative and modern-day counterpart of Princess Athena from the game Athena. She later appears in The King of Fighters series of fighting games as a female fighter character and has appeared in every one of its editions. She was also given her own RPG game Athena: Awakening from the Ordinary Life in 1999 released only in Japan for the Sony PlayStation. She is perhaps best known for changing her outfit and hair style for virtually every new KOF game.\nAthena was a highly anticipated character for the King of Fighters lineup and developers relate that they are constantly working to keep her in the series. Throughout the years, her sailor uniform outfit was a frequent request from Japanese fans that was denied due to the belief that it wouldn''t translate well with the overseas audience (this kept up until recent installments). Her official nickname is The Psychic-Powered Idol.\n\nIn the character popularity poll on Neo Geo Freak''s website, she was voted as the tenth favorite character with a total of 1,020 votes.'),
(3, 1, 'Kim Kaphwan, The Crown Jewel of Taekwondo', '"If you want power, follow me. I will make you mighty."', 'Kaphwan Kim, usually written surname first as Kim Kaphwan, is a character in both the Fatal Fury and The King of Fighters series by SNK. Kim is a master of Taekwondo and considers himself a fighter of justice. Kim''s original teammates, Chang Koehan and Choi Bounge, were to be teamed up with another dangerous criminal character to form the "Fugitive Team", but Kim was added to the team instead. His official nickname is The Crown Jewel of Taekwondo.\r\nOriginally, he was going to be named Kim Haifon, but this was changed because it wasn''t a viable Korean name. In more recent years, Kim''s first name, "Kaphwan", was seemingly dropped, as SNK-Playmore refers to him only as "Kim". Additionally, Kim in Korean is now known as the "head of the Kim family". The reasons for this are unknown, though rumors speculate that he was named after the Korean president of Viccom, who had a similar pronunciation to Kim''s name. Additionally, Kim''s sons are also named after the real Kim''s son (Jae Hoon) and younger brother (Dong Hwan). After the fallout of the first online game, Kaphwan was removed from Kim''s name.\r\n\r\nIn Gamest''s 1997 Heroes Collection, Kim was voted as the staff''s tenth favorite character. In a 2005 poll made by SNK-Playmore USA, he was voted as the tenth fan favorite character with a total of 119 votes.'),
(4, 3, 'Leona Heidern, The Silent Soldier', '"Run Away!"', 'Leona Heidern, is a character introduced in The King of Fighters ''96 as the new member to the Ikari Team. Before production for her debut game began, developers wanted to create a suitable replacement for Heidern as a part of the game''s overhaul. Leona was conceived to be an Orochi descendant by the time of her debut and her designers took special care to let their interests at the time reflect in her actions. Her official nickname is The Silent Soldier. In an interview with one of the series designers, Shinkiro, he replies that Leona is his favorite original character in the series.\r\nAside from the main body of the King of Fighters series, Leona is also featured in a one-shot chapter in the spin-off manga, The King of Fighters: Kyo and has her own character image album.'),
(6, 4, 'Iori Yagami, Unbridled Instinct', '"You''re nothing to me. I have but a single enemy..."', 'Iori Yagami is a video game character who made his first appearance in the Neo Geo fighting game, The King of Fighters ''95. He is a central recurring character and the initial enemy (and eventual rival) of Kyo Kusanagi.\r\nHe is the heir to one of the three clans that sealed the legendary snake entity, Orochi, 1,800 years ago. His clan, formerly known as the Yasakani, wields pyrokinetic powers. They keep the seal over Orochi intact with help from the Kusanagi and Yata clans using three ancient artifacts. His family''s treasure is the Yasakani Jewel and his family crest is the crescent moon, which he wears on the back of his jacket. He also wears a plain silver ring around his left middle finger; the significance of the ring, if any, is unknown. His official nickname is Unbridled Instinct.\r\n\r\nAside from the main body of the King of Fighters series, Iori features his own drama CD and character image album. His character is also a member of SNK''s character image band, Band of Fighters and he also appears as a regular antagonist in the spin-off manga, The King of Fighters: Kyo.'),
(7, 5, 'Benimaru Nikaido, The Shooting Star', '"Don''t hate me for my power. It''s so hard to be so talented."', 'Benimaru Nikaido is a character from SNK''s The King of Fighters game series. His straight hair stays up during fights due to a rather exaggerated case of electrostatics. He is a good friend of Kyo Kusanagi and a recurring participant in the King of Fighters tournaments. His official nickname is The Shooting Star. He was loosely based on the character Jean Pierre Polnareff from Jojo''s Bizarre Adventure, right down to his outfit in The King of Fighters ''94 and The King of Fighters ''95. Even after Benimaru''s name was decided on, the game developers continued to refer to him as Polnareff. Additionally, his taunt in The King of Fighters XI mirrors Polnareff''s stature from the manga. His vocal performance was initially deemed by his original designer to have nothing to do with the character''s original image.\r\nThe idea for his electric powers -as well as the other elemental powers for the rest of the Japan team- was derived from the anime Getter Robo. In the show, there were three featured heroes who served as the inspiration for the KOF trio: the protagonist had a "fiery" persona, his friend was "edgy and daring", and the third hero was the "down-to-earth giant". It is also a homage to a Japanese phrase of giving birth to fire (roughly translated: lighting strikes the earth which sparks the flame).\r\n\r\nDue to the particular pitch in his voice, some fans have voiced question to Benimaru''s sexuality to developers, to which they respond, "It''s not what you think. (Not that there''s anything wrong with that)." In Gamest''s 1997 Heroes Collection, Benimaru was voted as the staff''s thirteenth favorite character. He tied the spot with Samurai Shodown character, Shizumaru Hisame. In the character popularity poll on Neo Geo Freak''s website, he was voted as the sixth favorite character with a total of 1,269 votes.'),
(8, 6, 'Clark Still, Tough & Cool', '"Hate the sight of blood? Then get out of the battle biz!"', 'Clark Still, also mistakenly known as Clark Steel in some translations, is a character from the Ikari Warriors, Metal Slug and The King of Fighters video game series. In Gamest''s 1997 Heroes Collection, Clark was voted as the staff''s twenty-seventh favorite character. He shared the spot with Kizuna Encounter character, Kim Sue Il. His official nickname is Tough & Cool. Clark is part of the Ikari Warriors mercenary agency who is currently under the orders of Commander Heidern and Colonel Ralf Jones. He was formerly a spy before he entered their service. Clark is known for being a focused and loyal soldier who specializes in gathering information for their missions. He apparently wears his sunglasses to hide a scar in the middle of his forehead; it was caused by Ralf who was carelessly playing with his knives at the time.\r\nLike the other Ikari Warriors, Clark is usually ordered to enter each tournament by Heidern. He continues to play a supporting role in Ralf''s decisions and often accepts his superior''s views. He and Ralf helped Leona overcome her dramatic past at the end of 1997.\r\n\r\nIn 1999, his team is ordered to investigate the NESTS cartel. They were also formerly introduced to a new recruit, Whip. She immediately took a liking to Clark since he seemed more professional than Ralf. When she goes missing in the aftermath of 2000, he joined the search effort for her whereabouts in 2001. He thankfully receives a photo of Whip and Kula and hands it to the worried Ralf.\r\n\r\nFor 2003, Clark joined the mission to confirm the pilots of Sky Noah, a ship that was presumed to be associated with Rugal. Due to the Orochi seal being broken, Leona experiences the Riot of the Blood and goes berserk on Ralf and Clark at the end of the 2003 tournament. Fortunately, they subdue her and are able to report back to headquarters.'),
(9, 7, 'Terry Bogard, The Legendary Hungry Wolf', '"Another one bites the dust. Who''s next?"', 'Terry Bogard is a video game character created by SNK, and is the main character of the Fatal Fury series. He has appeared in every Fatal Fury and King of Fighters game, and is one of the characters of choice to symbolize the company in crossover games, merchandise and publicity. He appears to fit many Japanese stereotypes for an American character in appearance, personality and speech (his in-game vocabulary is usually limited to American colloquialisms, such as "Okay!" and "Hey, c''mon, c''mon.").\r\nTerry Bogard is the brother of Andy Bogard. Both of them were orphans adopted by Jeff Bogard. He is often referred to as the Legendary Hungry Wolf (from Garou Densetsu, meaning Legend of the Hungry Wolf). He has a pet monkey named Ukee (the previous mascot of SNK before Terry). He has a knack for scoring in basketball, which explains the creation of his Power Dunk move.\r\n\r\nIn Gamest''s 1997 Heroes Collection, Terry was voted as the staff''s eighth favorite character. In a 2005 poll made by SNK Playmore USA, he was voted as the number one fan favorite character with a total of 10014 votes. He was voted as the second most favorite character at the time of Garou: Mark of the Wolves with one commenter saying that "Terry''s the eternal hero". In the character popularity poll on Neo Geo Freak''s website, he was voted as the fourth favorite character with a total of 2,479 votes.'),
(10, 8, 'King', '"Okay, let''s call it a day before you''re seriously hurt."', 'King is a character in both Art of Fighting and The King of Fighters series. She debuted in the original Art of Fighting as the sole playable female character.\r\nKing appearance in the first game was made to hide her gender, with the game''s flyer even using he to refer the character. King is a skilled fighter who earned fame early in her career by defeating a famous Muay Thai champ. For various reasons -such as to hide her true identity, to present herself as a reliable fighter, and other issues with her gender- she made efforts to portray herself as a man to defend herself from the dangers of Southtown. Five years before Art of Fighting takes place, she suffers a humiliating defeat when she is found by Jack Turner and his gang. Finding herself poor and patronized by her tormentors, she was forced to work for Mr. Big as a bouncer. Her secret is exposed when she is defeated by Ryo Sakazaki who is searching for his sister Yuri. King agrees to help him save his sister and guides Ryo and Robert to Mr. Big''s hideout and is freed from her servitude once he is defeated.\r\nIn the following game, she continues her passion for street fighting until her younger brother, Jan, needs an operation to regain the use of his legs. She enters the King of Fighters tournament with hopes to win the prize money. In her ending, she is surprised to see Jan walking on his own two feet. Both Ryo and Robert paid for the operation in gratitude for her help in finding Yuri.\r\n\r\nAccording to Ryo, she is still well by the time Buriki One takes place. Running the Illusion bar, Ryo occasionally stops by to see her and catch up. Since he considers her a "good friend", their relationship probably isn''t on the romantic track.'),
(12, 9, 'Ash Crimson, The Sneering Blaze', '"Don''t play your trump card till the end...the very end!"', 'Ash Crimson is the protagonist of the Ash Saga. His first appearance was in The King of Fighters 2003 as the leader of the New Hero Team. His motives for entering are to take the powers of the descendants of the clans who sealed Orochi away 1,800 years ago (Kyo Kusanagi, Iori Yagami and Chizuru Kagura). He has succeeded thus far, leaving Kyo as the last power he needs.\r\nAsh was designed with the intent of creating an "attractive evil character" with little changes done to him since conception. During the initial planning stage for Ash, developers wanted to create a protagonist that has never been done for the franchise. Following this idea, they decided to create a feminine-looking and unheroic character to contrast the impact from the previous protagonists. Falcoon adds that the main goal for Ash was to make him an ambiguous hero that purposely makes players "feel bad" for cheering for him. His official nickname is The Sneering Blaze.'),
(13, 10, 'Maxima', '"Thanks for worrying about the environment. Ill be sure to recycle you once I''m through with you."', 'Maxima is a character best known for debuting as a member of the Hero Team in The King of Fighters ''99; he was inspired by an older SNK character in Robo Army. He was added to the cast with the desire to add a "somber and reliable middle-aged character" to counteract the introduction of multiple teenage characters - though his character bio indicates he is still in his late twenties.\r\nThe origins of both K'' and Maxima can be found in the Psikyo arcade game The Fallen Angels. This obscure 1998 release stars an emaciated goth in tight leather pants named Cool, along with a brawny, cybernetically enhanced police officer named Harry Ness. The man responsible for the design of both characters, Shinichi Morioka, migrated to SNK shortly after The Fallen Angels was released, and elements of Cool and Harry Ness'' design were used in the creation of K? and Maxima. The end result is that Maxima looks nearly identical to Harry. His namesake was taken from an AI program in the light novel Blue Knight Berserga Monogatari, which is set in the same universe as the anime series Armored Trooper Votoms.\r\n\r\nHe is voiced by Katsuyuki Konishi and Mike Jarmus.');

-- --------------------------------------------------------

--
-- Table structure for table `character_moves`
--

DROP TABLE IF EXISTS `character_moves`;
CREATE TABLE IF NOT EXISTS `character_moves` (
  `name` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `pros` varchar(500) NOT NULL,
  `cons` varchar(500) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  `damage` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `character_moves`
--

INSERT INTO `character_moves` (`name`, `description`, `pros`, `cons`, `id`, `character_id`, `img`, `damage`) VALUES
('Hangetsuzan', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 1, 1, 'img/moves/Kim/move1.png', 50),
('Kuchugetsuzan', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 3, 1, 'img/moves/Kim/move2.png', 70),
('Psycho Sword', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 5, 2, 'img/moves/Kim/move1.png', 50),
('Psycho Reflector', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 6, 2, 'img/moves/Kim/move2.png', 50),
('Baltic Launcher', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 7, 3, 'img/moves/Kim/move1.png', 50),
('Moon Slasher', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 8, 3, 'img/moves/Kim/move2.png', 50),
('100 Shiki: Oniyaki', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 9, 4, 'img/moves/Kim/move2.png', 50),
('Kuzukaze', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 10, 4, 'img/moves/Kim/move1.png', 50),
('Raijinken', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 11, 5, 'img/moves/Kim/move1.png', 50),
('Benimaru Lancer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 12, 5, 'img/moves/Kim/move2.png', 50),
('Super Argentine Backbreaker', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 13, 6, 'img/moves/Kim/move2.png', 50),
('Vulcan Punch', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 14, 6, 'img/moves/Kim/move1.png', 70),
('Power Wave', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 15, 7, 'img/moves/Kim/move1.png', 70),
('Burn Knuckle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 16, 7, 'img/moves/Kim/move2.png', 70),
('Tornado Kick ''95', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 17, 8, 'img/moves/Kim/move2.png', 70),
('Venom Strike', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 18, 8, 'img/moves/Kim/move1.png', 90),
('Germinal Caprice', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 19, 9, 'img/moves/Kim/move1.png', 90),
('Thermidor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 20, 9, 'img/moves/Kim/move2.png', 90),
('M19 Blitz Cannon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 21, 10, 'img/moves/Kim/move2.png', 90),
('Maxima Press', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce laoreet diam at tortor pellentesque ultrices. Duis sapien mi, interdum ut purus id, convallis pharetra purus. Vivamus ultricies est ex, a placerat leo scelerisque non. Sed molestie dictum orci, ac hendrerit est facilisis vel.', 'Pellentesque id ipsum consequat, malesuada mi at, posuere arcu. Aliquam tellus nibh, venenatis imperdiet rhoncus a, ultricies finibus dui. Fusce luctus, ante porttitor mollis aliquet, purus eros feugiat mauris, in venenatis risus nulla at mi. Integer maximus, dolor efficitur laoreet facilisis, elit est ultrices tellus, in aliquet turpis eros tincidunt mauris.', 'Donec efficitur dui purus, quis viverra nunc suscipit eget. Praesent ac ante aliquam, commodo tortor at, suscipit urna. Praesent sit amet nulla at est consequat consequat eget et lectus.', 22, 10, 'img/moves/Kim/move1.png', 120);

-- --------------------------------------------------------

--
-- Table structure for table `character_registry`
--

DROP TABLE IF EXISTS `character_registry`;
CREATE TABLE IF NOT EXISTS `character_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_name` varchar(100) NOT NULL,
  `picture_url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `character_registry`
--

INSERT INTO `character_registry` (`id`, `character_name`, `picture_url`) VALUES
(1, 'Kim', 'kim.png'),
(2, 'Athena', 'athena.png'),
(3, 'Leona', 'leona.png\r\n'),
(4, 'Iori', 'iori.png'),
(5, 'Benimaru', 'benimaru.png'),
(6, 'Clark', 'clark.png'),
(7, 'Terry', 'terry.png'),
(8, 'King', 'king.png'),
(9, 'Ash', 'ash.png'),
(10, 'Maxima', 'maxima.png');

-- --------------------------------------------------------

--
-- Table structure for table `character_stats`
--

DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE IF NOT EXISTS `character_stats` (
  `health` int(11) NOT NULL,
  `guard_gauge` int(11) NOT NULL,
  `tier_rank` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `utility` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `play_style` enum('Zoning','Grappler','Rushdown') DEFAULT NULL,
  `num_quarter_circle` int(11) NOT NULL,
  `num_double_quarter_circle` int(11) NOT NULL,
  `num_half_circle` int(11) NOT NULL,
  `num_double_half_circle` int(11) NOT NULL,
  `num_360` int(11) NOT NULL,
  `num_double_360` int(11) NOT NULL,
  `num_back_charge` int(11) NOT NULL,
  `num_down_charge` int(11) NOT NULL,
  `num_dp` int(11) NOT NULL,
  `num_pretzel` int(11) NOT NULL,
  `num_quarter_half_circle` int(11) NOT NULL,
  `num_half_quarter_circle` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `character_stats`
--

INSERT INTO `character_stats` (`health`, `guard_gauge`, `tier_rank`, `attack`, `speed`, `utility`, `id`, `character_id`, `difficulty`, `play_style`, `num_quarter_circle`, `num_double_quarter_circle`, `num_half_circle`, `num_double_half_circle`, `num_360`, `num_double_360`, `num_back_charge`, `num_down_charge`, `num_dp`, `num_pretzel`, `num_quarter_half_circle`, `num_half_quarter_circle`) VALUES
(100, 100, 1, 130, 130, 140, 1, 1, 10, 'Zoning', 3, 1, 0, 0, 0, 0, 0, 1, 0, 0, 3, 0),
(100, 100, 2, 140, 130, 120, 2, 2, 7, 'Zoning', 4, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(100, 100, 3, 130, 130, 125, 3, 3, 6, 'Rushdown', 2, 0, 0, 0, 0, 0, 2, 1, 0, 0, 3, 0),
(100, 100, 4, 120, 120, 120, 4, 4, 3, 'Zoning', 2, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0),
(100, 100, 5, 130, 140, 130, 7, 5, 2, 'Rushdown', 4, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(100, 150, 6, 150, 80, 90, 8, 6, 1, 'Grappler', 1, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0),
(100, 100, 7, 135, 100, 100, 9, 7, 4, 'Zoning', 3, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(100, 100, 8, 120, 120, 110, 10, 8, 5, 'Zoning', 2, 0, 1, 3, 0, 0, 0, 0, 1, 0, 0, 0),
(100, 100, 9, 100, 130, 150, 11, 9, 8, 'Zoning', 1, 2, 0, 1, 0, 0, 2, 1, 0, 0, 1, 0),
(100, 150, 10, 150, 50, 70, 12, 10, 9, 'Grappler', 3, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
