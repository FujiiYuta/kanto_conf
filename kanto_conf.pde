//kadai1
//kanto's confortability (my subjectivity)
//3-4-47 Yuta Fujii
//by weather.tsv(weather.dl)
import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*; //Load Library
//SQLite db;
SQLite db = new SQLite(this, "weather.db");
PImage kaiteki;
PImage not_kaiteki;
PImage mapImage;
int m =2;
int d = 5;
int a_temp[] = new int[7];
int humi[] = new int[7];
/* kanto's prefecture_id
 tokyo =13
 kanagawa = 14
 chiba = 12
 ibaragi = 8
 saitama = 11
 gunma = 10
 tochigi = 9
 */

void setup() {
  db = new SQLite(this, "weather.db");
  size(800, 800);
  mapImage = loadImage( "kanto.gif" );
  kaiteki = loadImage("niko.png");
  not_kaiteki = loadImage("hukai.png");
  image( mapImage, 0, 0 );
  fill(244, 146, 245);
  rect(35, 10, 150, 30);
  fill(0);
  textSize(24);
  text("next month", 44, 35);
 
}


void draw() {
   if (db.connect()) {
    for (int i = 8; i < 15; i++) {
      int a = i - 8;
      String sql = "SELECT month, avg(highest), avg(humidity) FROM weather_table where month = "+m+" and prefecture_id = "+i+" group by month";
      //println(sql);
      db.query(sql);

      a_temp[a] = db.getInt("avg(highest)");
      humi[a] = db.getInt("avg(humidity)");
      //while (db.next()) {
      //  println(db.getInt("month")+"月の最高気温平均は"+db.getInt("avg(highest)")
      //    +"度で、湿度は"+db.getInt("avg(humidity)")+"%です");
      //}
    }
  }
  //println(m);
  image( mapImage, 0, 0 );
  fill(244, 146, 245);
  rect(35, 10, 150, 30);
  fill(0);
  textSize(24);
  text("next month", 44, 35);
  text(m+"'s Confortability", 500, 780);

  //描画命令
  text("Temprature : "+a_temp[d]+"℃", 580, 650);
  text("Humidity : "+humi[d]+"%", 580, 700);
  if (d == 0) {
    text("ibaragi", 580, 600);
  } else if (d == 1) {
    text("tochigi", 580, 600);
  } else if (d == 2) {
    text("gunma", 580, 600);
  } else if (d == 3) {
    text("saitama", 580, 600);
  } else if (d == 4) {
    text("chiba", 580, 600);
  } else if (d == 5) {
    text("tokyo", 580, 600);
  } else if (d == 6) {
    text("kanagawa", 580, 600);
  }

  for (int i = 0; i < 7; i++) {
    if (humi[i] >= 40 && humi[i] <= 60 && a_temp[i] <= 26 && a_temp[i] >= 12) {
      if (i == 0) {
        image(kaiteki, 442, 305);
      }
      if (i == 1) {
        image(kaiteki, 349, 110);
      }
      if (i == 2) {
        image(kaiteki, 119, 181);
      }
      if (i == 3) {
        image(kaiteki, 231, 343);
      }
      if (i == 4) {
        image(kaiteki, 443, 582);
      }
      if (i == 5) {
        image(kaiteki, 268, 464);
      }
      if (i == 6) {
        image(kaiteki, 220, 557);
      }
    } else {
      if (i == 0) {
        image(not_kaiteki, 442, 305);
      }
      if (i == 1) {
        image(not_kaiteki, 349, 110);
      }
      if (i == 2) {
        image(not_kaiteki, 119, 181);
      }
      if (i == 3) {
        image(not_kaiteki, 231, 343);
      }
      if (i == 4) {
        image(not_kaiteki, 443, 582);
      }
      if (i == 5) {
        image(not_kaiteki, 268, 464);
      }
      if (i == 6) {
        image(not_kaiteki, 220, 557);
      }
    }
  }
}




void mouseClicked() {
  //rect(35, 10, 150, 30);

  if (mouseX <= 185 && mouseX >= 35 && mouseY >= 10 && mouseY <= 40) {
    if (m != 12) {
      m++;
    } else {
      m = 1;
    }
  }
  if (dist(mouseX, mouseY, 399, 160) <= 50) {
    //tochigi
    // i= 9
    //温度 : (600,600)
    //湿度 : (600,650)
    //textSize(24);
    d = 1;
  }
  if (dist(mouseX, mouseY, 169, 231) <= 50) {
    //gunma
    //i = 10;
    d = 2;
  }
  if (dist(mouseX, mouseY, 492, 355) <= 50) {
    //ibaragi
    //i = 8;
    d = 0;
  }
  if (dist(mouseX, mouseY, 493, 622) <= 50) {
    //chiba
    //i = 12;
    d = 4;
  }
  if (dist(mouseX, mouseY, 281, 393) <= 50) {
    //saitama
    //i = 11;
    d = 3;
  }
  if (dist(mouseX, mouseY, 318, 514) <= 50) {
    //tokyo
    //i = 13;
    d = 5;
  }
  if (dist(mouseX, mouseY, 270, 607) <= 50) {
    //kanagawa
    //i = 14;
    d = 6;
  }
}
/*

 
 */
