// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherItemAdapter extends TypeAdapter<WeatherItem> {
  @override
  final int typeId = 0;

  @override
  WeatherItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherItem(
      cityName: fields[0] as String,
      tempMax: fields[2] as int,
      temp: fields[1] as int,
      caption: fields[4] as String,
      tempMin: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.tempMax)
      ..writeByte(3)
      ..write(obj.tempMin)
      ..writeByte(4)
      ..write(obj.caption);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
