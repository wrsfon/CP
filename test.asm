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
mov rax, 1
mov [i], rax
_L1:
mov rax, [i]
mov rbx, 10
cmp rax, rbx
jge _L2
mov rax, [i]
mov rbx, 1
cmp rax, rbx
je _L3
xor rdx, rdx
mov rax, [i]
xor rdx, rdx
mov rcx, 2
idiv rcx
mov rax, rdx
mov rbx, 0
cmp rax, rbx
je _L4
xor rdx, rdx
mov rax, [i]
xor rdx, rdx
mov rcx, 3
idiv rcx
mov rax, rdx
mov rbx, 0
cmp rax, rbx
je _L5
xor rdx, rdx
mov rax, [i]
xor rdx, rdx
mov rcx, 5
idiv rcx
mov rax, rdx
mov rbx, 0
cmp rax, rbx
je _L6
xor rdx, rdx
mov rax, [i]
xor rdx, rdx
mov rcx, 7
idiv rcx
mov rax, rdx
mov rbx, 0
cmp rax, rbx
je _L7
mov rdx, [i]
mov rcx, _LC0
call printf
xor rcx, rcx
call fflush
_L7:
_L6:
_L5:
_L4:
mov rax, [i]
mov rbx, 2
cmp rax, rbx
jne _L8
mov rdx, [i]
call printf
xor rcx, rcx
call fflush
_L8:
mov rax, [i]
mov rbx, 3
cmp rax, rbx
jne _L9
mov rdx, [i]
call printf
xor rcx, rcx
call fflush
_L9:
mov rax, [i]
mov rbx, 5
cmp rax, rbx
jne _L10
mov rdx, [i]
call printf
xor rcx, rcx
call fflush
_L10:
mov rax, [i]
mov rbx, 7
cmp rax, rbx
jne _L11
mov rdx, [i]
call printf
xor rcx, rcx
call fflush
_L11:
_L3:
mov rax, [i]
add rax, 1
mov [i], rax
jmp _L1
_L2:
xor rax, rax
pop rbp
ret
