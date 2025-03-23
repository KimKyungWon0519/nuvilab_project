import 'package:nuvilab_project/data/model/mesuring_data.dart';
import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';

/// Data 모델을 Domain 모델로 변환
class FineDustByCityMapper {
  FineDustByCityMapper._();

  static List<FineDustByCity> toFineDustCities(
      MesuringData pm10, MesuringData pm25) {
    List<FineDustByCity> fineDustByCities = [];

    fineDustByCities.add(
      FineDustByCity(
        cityName: '서울',
        pm10: double.parse(pm10.seoul!),
        pm25: double.parse(pm25.seoul!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '부산',
        pm10: double.parse(pm10.busan!),
        pm25: double.parse(pm25.busan!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '대구',
        pm10: double.parse(pm10.daegu!),
        pm25: double.parse(pm25.daegu!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '인천',
        pm10: double.parse(pm10.incheon!),
        pm25: double.parse(pm25.incheon!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '광주',
        pm10: double.parse(pm10.gwangju!),
        pm25: double.parse(pm25.gwangju!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '대전',
        pm10: double.parse(pm10.daejeon!),
        pm25: double.parse(pm25.daejeon!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '울산',
        pm10: double.parse(pm10.ulsan!),
        pm25: double.parse(pm25.ulsan!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '경기',
        pm10: double.parse(pm10.gyeonggi!),
        pm25: double.parse(pm25.gyeonggi!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '강원',
        pm10: double.parse(pm10.gangwon!),
        pm25: double.parse(pm25.gangwon!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '충북',
        pm10: double.parse(pm10.chungbuk!),
        pm25: double.parse(pm25.chungbuk!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '충남',
        pm10: double.parse(pm10.chungnam!),
        pm25: double.parse(pm25.chungnam!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '전북',
        pm10: double.parse(pm10.jeonbuk!),
        pm25: double.parse(pm25.jeonbuk!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '전남',
        pm10: double.parse(pm10.jeonnam!),
        pm25: double.parse(pm25.jeonnam!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '경북',
        pm10: double.parse(pm10.gyeongbuk!),
        pm25: double.parse(pm25.gyeongbuk!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '경남',
        pm10: double.parse(pm10.gyeongnam!),
        pm25: double.parse(pm25.gyeongnam!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '제주',
        pm10: double.parse(pm10.jeju!),
        pm25: double.parse(pm25.jeju!),
      ),
    );
    fineDustByCities.add(
      FineDustByCity(
        cityName: '세종',
        pm10: double.parse(pm10.sejong!),
        pm25: double.parse(pm25.sejong!),
      ),
    );

    return fineDustByCities;
  }
}
