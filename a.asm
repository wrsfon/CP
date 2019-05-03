DEFAULT REL
extern printf
extern scanf
extern fflush
extern usleep
global main
section .data
_fmin db "%ld", 0
i dq 0
_LC0 db "Round ", 0
_LC1 db "%ld", 0
_LC2 db "even", 10,"show", 10, 0
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
mov rax, 0
mov [i], rax
mov rax, [i]
mov rbx, 5
_L1:
cmp rax, rbx
jge _L2
mov rdx, "Round "
mov rcx, _LC0
call printf
xor rcx, rcx
call fflush
mov rdx, [i]
mov rcx, _LC1
call printf
xor rcx, rcx
call fflush
mov rax, [i]
mov rbx, 2
cmp rax, rbx
jge _L3
mov rdx, "even\nshow"
mov rcx, _LC2
call printf
xor rcx, rcx
call fflush
_L3:
mov rax, [i]
add rax, 1
mov [i], rax
jmp _L1
_L2:
xor rax, rax
pop rbp
ret
