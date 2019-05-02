DEFAULT REL
extern printf
extern scanf
extern fflush
extern usleep
global main
section .data
_fmin db "%ld", 0
x db 0
a db 0
y db 0
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
mov rax, 4
mov [x], rax
mov rax, 86
mov [a], rax
mov rax, [x]
mov [y], rax
mov rdx, 5
mov eax, 0
call printf
xor rcx, rcx
call fflush
xor rax, rax
pop rbp
ret
