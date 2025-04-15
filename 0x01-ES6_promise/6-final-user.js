import signUpUser from './4-user-promise';
import uploadPhoto from './5-photo-reject';

export default function handleProfileSignup(firstName, lastName, fileName) {
  return Promise.allSettled([
    signUpUser(firstName, lastName),
    uploadPhoto(fileName),
  ]).then((data) => data.reduce((acc, item) => {
    acc.push({ status: item.status, value: item.value || item.reason.toString() });
    return acc;
  }, []));
}
