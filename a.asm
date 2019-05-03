DEFAULT REL
extern printf
extern scanf
extern fflush
extern usleep
global main
section .data
_fmin db "%ld", 0
i dq 1,2,3,4,5,
j dq 0
x dq 0
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
mov rax, [i + 3 * 8]
mov [j], rax
mov rbx, i
mov rcx, [j]
imul rcx, 8
add rbx, rcx
mov rax, [rbx]
imul rax, -1
mov [x], rax
mov rdx, [x]
mov rcx, _LC0
call printf
xor rcx, rcx
call fflush
xor rax, rax
pop rbp
ret
