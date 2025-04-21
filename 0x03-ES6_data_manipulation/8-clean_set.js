export default function cleanSet(set, startString) {
  if (
    typeof set !== 'object'
    || typeof startString !== 'string'
    || startString.length === 0
  ) {
    return '';
  }

  return [...set]
    .map(
      (item) => item && item.startsWith(startString) && item.slice(startString.length),
    )
    .filter((item) => item)
    .join('-');
}
