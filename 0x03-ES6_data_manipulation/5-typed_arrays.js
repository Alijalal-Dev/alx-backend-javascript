export default function createInt8TypedArray(length, position, value) {
  const array = new ArrayBuffer(length);
  const val = new DataView(array);
  try {
    val.setInt8(position, value);
    return val;
  } catch (err) {
    throw Error('Position outside range');
  }
}
