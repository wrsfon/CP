DEFAULT REL
extern printf
extern scanf
extern fflush
extern usleep
global main
section .data
_fmin db "%ld", 0
x dq 0
y dq 0
_LC0 db "%ld", 0
_LC1 db "%ld", 0
_LC2 db "sdd", 10,"fs", 10, 0
section .text
_input:
push rbp
mov rbp, rsp
sub rsp, 32
lea rax, [rbp - 8]
mov rcx, _fmin
mov rdx, rax
call scanf
mov rax, [rbp - 8]
leave
ret
main:
push rbp
mov rax, 5
add rax, 3
mov [x], rax
mov rax, 4
mov [y], rax
mov rdx, 6
mov rcx, _fmin
call printf
xor rcx, rcx
call fflush
mov rdx, 12
mov rcx, _fmin
call printf
xor rcx, rcx
call fflush
mov rdx, [x]
mov rcx, _LC0
call printf
xor rcx, rcx
call fflush
mov rdx, [y]
mov rcx, _LC1
call printf
xor rcx, rcx
call fflush
mov rdx, "sdd\nfs"
mov rcx, _LC2
call printf
xor rcx, rcx
call fflush
xor rax, rax
pop rbp
ret
