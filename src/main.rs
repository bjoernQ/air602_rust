#![no_std]
#![no_main]
#![allow(non_camel_case_types)]

use core::panic::PanicInfo;

type c_char = u8;
type c_void = core::ffi::c_void;

extern "C" {
    fn wm_printf(input: *const c_char) -> c_void;

    fn tls_os_time_delay(time: u32);
}

#[no_mangle]
pub extern "C" fn UserMain() {
    // almost nothing for now - glad if this compiles and runs

    loop {
        unsafe {
            tls_os_time_delay(500); // 1 second
            wm_printf("Hello World\r\n\0".as_ptr() as *const _);
        }
    }
}

#[panic_handler]
fn panic(_: &PanicInfo) -> ! {
    loop {}
}
