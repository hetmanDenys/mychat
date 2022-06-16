function empty_form(){
    let input = document.getElementById('input').value;
    if(input === ''){
        alert('You forgot to enter text.');
    }
}



// document.addEventListener("DOMContentLoaded", (event) => {
//     const data_id = document.querySelector(".input");
//     let data = data_id.dataset.id;
//     const url = 'user_chat?user_id=' + data
//
//     // переделать на async await
//     // interval
//     //   fetch->GET->server (messages)
//     //  update DOM if there are new messages
//     setInterval(async () => {
//         const res = await fetch(url, {
//             method: 'GET',
//             credentials: 'same-origin',
//             headers: {
//                 'Content-Type': 'application/json'
//             }
//         });
//          const sss = await res.json()
//          console.log(sss)
//     }, 2000);
// });
