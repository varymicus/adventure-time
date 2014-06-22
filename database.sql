CREATE DATABASE  IF NOT EXISTS `adventure_time` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adventure_time`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: adventure_time
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_id_UNIQUE` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Warrior','You are one of this realm\'s greatest warriors, with very few equals in martial skill. You begin with one of each weapon you choose to be skilled in, one of which will be of moderate magical power. In addition, you can start with armor and/or shield if you like: anything from leather to plate armor and in between. Or if you choose to be skilled in modern weaponry, you can pick bullet-proof vests, riot shields, or even power armor.'),(2,'Scientist','Your knowledge of mankind\'s most advanced science is almost without peer, in this world or the other. You begin your adventure with a number of simple tools and gadgets related to your fields of study. If you buy a Domain, however, it comes with a number of laboratories and workshops that you can put to use. In addition, thought it has been stated that the new world\'s laws of physics do not always function as you think they should, you will find that anything you actually have studied and know as a fact is far more solid and resistant to fluctuation - which isn\'t always good.'),(3,'Rogue','A thief, a diplomat, and/or a spy, your cunning, persuasiveness, and stealth are second to none. In the beginning you have an expensive suit or dress, all the spy gadgets you could imagine (adjusted to the tech level you choose, of course), a few small weapons (daggers, crossbow, silenced pistol, etc.), and a sports vehicle to go around with (or a fancy wagon).'),(4,'Ranger','The woodsman, beastmaster, and tracker, you\'re a real badass that takes no shit from anyone. Your starting equipment will depend on the desired tech level: you will begin with either a sword and a bow, leather armor, and a green sneaky cloak - or with a rifle and a pistol, a flak vest, a gas mask, and a long trenchcoat. Either way, you will also get a knife and some other basic tools to go around with.'),(5,'Wizard','A true master of the arcane, you are privy of such secrets that few would ever comprehend. Sense of right or wrong optional. You begin your adventure with a robe, your trusty spellbook, and a number of magical scrolls, wands, and other tools. If you start with a Domain, it comes with a library and a magical laboratory. You will also get a familiar; a cat, raven, imp, or similar, an intelligent little creature capable of speech, that goes with you everywhere and qualifies as a Bro.'),(6,'Bard','You are the star! You are recognized as one of the greatest musicians, artists, or entertainers in this new world. You begin with the musical instruments or tools that you choose to be skilled in: if you start with a Domain, it will also come with a studio for you to do all the work and creation stuff in, as well as a fancy queen-sized bed and a trophy room.');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perks`
--

DROP TABLE IF EXISTS `perks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perks` (
  `perk_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `cost` int(11) DEFAULT '0',
  `can_rebuy` bit(1) DEFAULT b'0',
  PRIMARY KEY (`perk_id`),
  UNIQUE KEY `perk_id_UNIQUE` (`perk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perks`
--

LOCK TABLES `perks` WRITE;
/*!40000 ALTER TABLE `perks` DISABLE KEYS */;
/*!40000 ALTER TABLE `perks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `base_class` int(11) NOT NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE KEY `skill_id_UNIQUE` (`skill_id`),
  KEY `fk_skills_class1_idx` (`base_class`),
  CONSTRAINT `fk_skills_class` FOREIGN KEY (`base_class`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Weapon Skill','The cornerstone of the warrior\'s martial supremacy, this skill allows you to learn the use of a number of weapons of your choice. The more points you have, the easier you can pick up entirely new weapons and learn how to use them.',1),(2,'Physique','This attribute will improve your physical abilities. It allows you to not only lift more and hit harder, but also take more damage and endure longer.',1),(3,'Willpower','Your raw mental strength - not intelligence or cunning, but just how far you can be pushed before you give up, how difficult you are to influence or coerce (mundanely or magically), and how powerful your presence is. Raising this beyond the normal five points will allow you to crush the spirits of the weak-willed, without ever having to fight them at all.',1),(4,'Education','You will instantly learn any field available in the world (or enhance one you already know), basically anything you can earn a doctorate or mastery in - as well as make it easier to learn new ones. Though you cannot start with them, you can later pick up the education of a bunch of native sciences, except for magic and that kind of stuff, which is a different class altogether.',2),(5,'Wits','It\'s not always what you know, but how flexible that knowledge is. This attribute governs your problem-solving skills, thinking outside the box, getting Eureka moments, and inventing new theories and building strange contraptions out of the sciences you know.',2),(6,'Insight','It\'s a strange new world, where things do not oftern work at all how you think they should. This is your mental clarity, the ability to see the cogs behind the machine to to speak, and how the physics and sciences here correlate to what you already know. At higher levels, you may even learn how to directly manipulate them.',2),(7,'Dexterity','How well you can pick locks, how hard you are to see, how easily you scale walls, how convincing your forged documents are, and a whole number of other rogue skills are related to this attribute. If you manage to get over the human limits of five points, you\'ll basically become Carmen Sandiego.',3),(8,'Guile','Thinking fast on the fly is an important ability to have for one such as you, and this attribute improves it. You can get over setbacks and complications and adjust your plans quickly. This skill also allows you to see things missed by others, such as vital clues, secret doors, or glowy weak points.',3),(9,'Charisma','Just how much of a people person you are. How well you can persuade or deceive the others, maintain your cover and disguise, get away with it all, and still have people like you and think you\'re awesome by the end. Subtle intimidation (\"Shame if something happened...\") goes under this skill too.',3),(10,'Nature Lore','This attribute deals with your knowledge of all-around nature stuff, such as plants, weather and climate, terrain and geography, tracking, and the numerous creatures and people living therein. For every two points, choose a \"favoured terrain\", of which you know a lot more.',4),(11,'Beastmaster','For the first point in this attribute (which is free if this is your primary class, of course), you will receive a permanent animal companion. The animal is enhanced to human intelligence and longer lifespan, and is considered a Bro, although its own skillset is somewhat limited. Otherwise, any point put here will enhance your dealings with animals, how well you can train and command them, and how they see you in general.',4),(12,'Nature Magic','Teaches you the use of a number of nature-related magical disciplines, as detailed in the \"magic\" section. They are somewhat weaker and much more subtle than anything a wizard could get, often making it unclear if any magic was used at all.',4),(13,'Arcane Knowledge','The bread and butter of this class, this attribute details just what magics you know and how good you are at them. Your spells range from subtle to extremely flashy, and the more powerful ones are powerful indeed - up to worid-changing levels with the ones beyond five points initially available to you. Refer to the \"magic\" section for the detailed list.',5),(14,'Spellcraft','Determines just how flexible you can be with your spells, to what extent you can shape and mold them to something different, and how good you are at coming up with your own spells. Metamagic, in other words. Can also be applied to Ranger\'s Nature Magic, though to lesser extent.',5),(15,'Memory','How many spells you can hold in your head at once, and how much you cak cast them before you need to rest or consult your book again. Naturally, it has a number of applications for nonmagical matters as well.',5),(16,'Schools of Art','Governs not just musical instruments, but any type of entertainment: arts, comics, poetry and oratory, literature, filmmaking, and so forth. You can choose a mash-up of any that you like, as with the usual rules, and it is easier for you to learn more of them later.',6),(17,'Magnetism','The other thing bards are known for. Determines how big your fanbase is, how attractive you are, and how rarely you sleep alone (also covers Trap Sense). Later, especially on 5+ points, you will basically have a cult of personality of your own, and could do decidedly non-bard stuff like become a warlord or conqueror.',6),(18,'Legend Lore','Being a bard, you\'ve also ended up knowing a little bit of everything, and this attribute reflects that. It gives you little bits of random knowledge and lore regarding this world, even of matters that would typically belong to some other class. In addition, every three points put here will give you an extra point that you can put in any attribute of any other class (with the usual limitations).',6);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synergy`
--

DROP TABLE IF EXISTS `synergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synergy` (
  `idsynergy` int(11) NOT NULL AUTO_INCREMENT,
  `class_id1` int(11) NOT NULL,
  `class_id2` int(11) NOT NULL,
  PRIMARY KEY (`idsynergy`),
  UNIQUE KEY `idsynergy_UNIQUE` (`idsynergy`),
  KEY `fk_synergy_class_idx` (`class_id1`),
  KEY `fk_synergy_class2_idx` (`class_id2`),
  CONSTRAINT `fk_synergy_class1` FOREIGN KEY (`class_id1`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_synergy_class2` FOREIGN KEY (`class_id2`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synergy`
--

LOCK TABLES `synergy` WRITE;
/*!40000 ALTER TABLE `synergy` DISABLE KEYS */;
INSERT INTO `synergy` VALUES (1,1,3),(2,2,5),(3,3,6),(4,1,4);
/*!40000 ALTER TABLE `synergy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-22  2:25:24
