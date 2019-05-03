DEFAULT REL
extern printf
extern scanf
extern fflush
extern usleep
global main
section .data
_fmin db "%ld", 0
a dq 0,1,2,3,4,5,
i dq 0
d dq 0
_LC0 db "%ld", 0
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
mov rax, 2
mov [i], rax
mov rbx, a
mov rcx, [i]
imul rcx, 8
add rbx, rcx
mov rax, [rbx]
mov [d], rax
mov rdx, [d]
mov rcx, _LC0
call printf
xor rcx, rcx
call fflush
xor rax, rax
pop rbp
ret
