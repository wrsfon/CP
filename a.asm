DEFAULT REL
extern printf
extern scanf
extern fflush
extern usleep
global main
section .data
_fmin db "%ld", 0
i dq 0
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
xor rdx, rdx
mov rax, 6
xor rdx, rdx
mov rcx, 3
idiv rcx
push rax
xor rdx, rdx
mov rax, 14
add rax, 7
push rax
xor rdx, rdx
mov rax, 3
add rax, 3
pop rcx
mov rbx, rax
mov rax, rcx
mov rcx, rbx
idiv rcx
mov rax, rdx
pop rbx
imul rax, rbx
mov [i], rax
mov rdx, [i]
mov rcx, _LC0
call printf
xor rcx, rcx
call fflush
xor rax, rax
pop rbp
ret
